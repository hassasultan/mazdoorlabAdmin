<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PremiumGalleryPackage;
use App\Models\PremiumGalleryPurchase;
use App\Models\PaymentMethod;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;



class PremiumGalleryPurchaseAPIController extends Controller
{

    // premium gallery package
    public $prm_gallery_pack;
    // premium gallery package
    public $prm_gallery_pur;
    // user
    public $user;

    public function __construct(PremiumGalleryPackage $premium_gl_pack,PaymentMethod $pay, PremiumGalleryPurchase $gallerypur, User $user){
        $this->prm_gallery_pack = $premium_gl_pack;
        $this->prm_gallery_pur = $gallerypur;
        $this->paymethod = $pay;
        $this->user = $user;
    }


    public function index (Request $request)
    {
            $shop = DB::table('premium_gallery_purchases')
                        ->join('users','premium_gallery_purchases.user_id','=','users.id')
                        ->join('premium_gallery_packages','premium_gallery_purchases.premium_gallery_id','=','premium_gallery_packages.id')
                        ->select('premium_gallery_purchases.id','users.name as user_name','premium_gallery_packages.name as gallery_name','premium_gallery_purchases.coins','premium_gallery_purchases.created_at','premium_gallery_purchases.updated_at')
                        ->where('user_id',$request->user_id)
                        ->get();
            if(sizeof($shop)>0){
                return ["success"=>"true","data"=>$shop];
            }else{
                return $this->sendError('There is not Premium Gallery Package!');
            }
    }

    public function create(Request $req)
    {
        try {
            $this->validate($req, [
                'user_id',
                'premium_gallery_id'
            ]);

            $gallery_package = $this->prm_gallery_pack->find($req->premium_gallery_id);
            $check = true;
            if($req->payment_method_id){
                $payment_method = $this->paymethod->find($req->payment_method_id);
                if(!($payment_method)){
                    $check = false;                
                }
            }
            $user = $this->user->find($req->user_id);

            if($gallery_package){
                if($gallery_package->status == 'publish') {
                    if($user){
                        if($req->payment_method_id || $req->coins>0){
                            if($check){
                                $this->prm_gallery_pur->user_id = $req->input('user_id');
                                $this->prm_gallery_pur->payment_method_id = $req->input('payment_method_id');
                                $this->prm_gallery_pur->premium_gallery_id = $req->input('premium_gallery_id');
                                $this->prm_gallery_pur->coins = $req->input('coins');
                                $this->prm_gallery_pur->save();
                            }else{
                                return $this->sendError('This Payment method is not Exist!');
                            }
                        }else{
                            return $this->sendError('Use payment method or coins!');
                        }
                    }else{
                        return $this->sendError('This user is not Exist!');
                    }
                }else{
                    return $this->sendError('This Gallery is not published, please select another one!');
                }
            }else{
                return $this->sendError('This gallery package is not Exist!');
            }

        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }


        return $this->sendResponse($this->prm_gallery_pur, 'Premium Gallery Purchase successfully!');

    }

}
