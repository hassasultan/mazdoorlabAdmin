<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\BannerPackage;
use App\Models\PremiumBannerPackage;
use App\Models\PaymentMethod;
use App\Models\BannerPurchase;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use App\Models\Payment;



class BannerPurchaseAPIController extends Controller
{
    // banner package
    public $banner_package;
    // premium banner package
    public $premiumBanner_package;
    // banner purchase
    public $banner_purchase;
    // user
    public $user;

    public function __construct(PremiumBannerPackage $pBannerPack,PaymentMethod $pay, BannerPackage $bannerpack, BannerPurchase $bannerpur, User $user){
        $this->banner_package = $bannerpack;
        $this->banner_purchase = $bannerpur;
        $this->premiumBanner_package = $pBannerPack;
        $this->paymethod = $pay;
        $this->user = $user;
    }

    public function index(Request $request)
    {
        if (!isset($request->user_id) && !$request->user_id) {
            return $this->sendError('User id is required!');
        }
        if (User::find($request->user_id)) {
            $shop = DB::table('banner_purchases')
                ->join('users', 'banner_purchases.user_id', '=', 'users.id')
                ->join('premium_banner_packages', 'banner_purchases.premium_banner_id', '=', 'premium_banner_packages.id')
                ->where('user_id', $request->user_id)
                ->select('banner_purchases.id', 'users.name as user_name', 'premium_banner_packages.name as banner_name', 'banner_purchases.coins', 'banner_purchases.amount', 'banner_purchases.description', 'banner_purchases.created_at', 'banner_purchases.updated_at')
                ->get();
            if (sizeof($shop) > 0) {
                return $this->sendResponse($shop, 'Banner Purchase List!');
            } else {
                return $this->sendError('There is no Premium Banner Package!');
            }
        } else {
            return $this->sendError('User not found!');
        }
    }

    public function create(Request $req)
    {
        try {
            $this->validate($req, [
                'user_id' => 'required',
                'premium_banner_id' =>'required',
                'payment_method_id' => 'required',
                'number' => 'required',
                'exp_month' => 'required',
                'exp_year' => 'required',
                'cvc' => 'required',
                'amount'=> 'required',
                'desc' => 'required',
            ]);
            $bannerpackage = $this->premiumBanner_package->find($req->premium_banner_id);
            $check = true;
            if($req->payment_method_id){
                $payment_method = $this->paymethod->find($req->payment_method_id);
                if(!($payment_method)){
                    $check = false;                
                }
            }
            $user = $this->user->find($req->user_id);
            $data = [];
            if($bannerpackage){
                if($bannerpackage->status == 'publish'){
                    if($user){
                        if($check){
                            $data['number'] = $req->number;
                            $data['exp_month'] = $req->exp_month;
                            $data['exp_year'] = $req->exp_year;
                            $data['cvc'] = $req->cvc;
                            $data['amount'] = $req->amount;
                            $data['desc'] = $req->desc;
                            if((int)$req->payment_method_id == 7){
                                $payment = Payment::strip_checkout($data);
                                if($payment['status']){
                                    $this->banner_purchase->user_id = $req->input('user_id');
                                    $this->banner_purchase->payment_method_id = $req->input('payment_method_id');
                                    $this->banner_purchase->premium_banner_id = $req->input('premium_banner_id');
                                    $this->banner_purchase->coins = 0;
                                    $this->banner_purchase->amount = $req->input('amount');
                                    $this->banner_purchase->description = $req->input('desc');
                                    $this->banner_purchase->save();
                                } else{
                                    return $this->sendError($payment['message']);
                                }
                            } else{
                                return $this->sendError('Payment Failed!');
                            }
                        }
                        else{
                            return $this->sendError('This Payment method is not Exist!');
                        }
                    }else{
                        return $this->sendError('This user is not Exist!');
                    }
                }else{
                    return $this->sendError('This banner is not published, please select another one!');
                }
            }else{
                return $this->sendError('This banner package is not Exist!');
            }
        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }
        return $this->sendResponse($this->banner_purchase, 'Banner Purchase successfully!');
    }
}
