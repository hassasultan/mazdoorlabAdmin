<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\CoinPackage;
use App\Models\CoinPurchase;
use App\Models\PaymentMethod;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;



class CoinPurchaseAPIController extends Controller
{
    public function index (Request $request)
    {
        $shop = DB::table('coin_purchases')
                       ->join('users','coin_purchases.user_id','=','users.id')
                       ->join('coin_packages','coin_purchases.coins_package_id','=','coin_packages.id')
                       ->join('payment_methods','coin_purchases.payment_method_id','=','payment_methods.id')
                       ->select('coin_purchases.id','users.name as user_name','coin_packages.name as coin_name','payment_methods.name as payment_name','coin_purchases.amount','coin_purchases.created_at','coin_purchases.updated_at')
                       ->where('user_id',$request->user_id)
                       ->get();
            if(sizeof($shop)>0){
                return ["success"=>"true","data"=>$shop];
            }else{
                return $this->sendError('There is not Premium Coin Package!');
            }
    }

    public function create(Request $req)
    {
        try {
            $this->validate($req, [
                'user_id',
                'coins_package_id',
                'payment_method_id',
                'amount'
            ]);

            $coinpackage = CoinPackage::find($req->coins_package_id);
            $user = User::find($req->user_id);
            $payment_method = PaymentMethod::find($req->payment_method_id);

            if($coinpackage && $user && $payment_method){
                if($coinpackage->status == 'publish') {
                    if($user){
                        $coin_purchase = new CoinPurchase();
                        $coin_purchase->user_id = $req->input('user_id');
                        $coin_purchase->coins_package_id = $req->input('coins_package_id');
                        $coin_purchase->payment_method_id = $req->input('payment_method_id');
                        $coin_purchase->amount = $req->input('amount');
                        $coin_purchase->save();
                    }else{
                        return $this->sendError('This user is not Exist!');
                    }
                }else{
                    return $this->sendError('This Coin is not published, please select another one!');
                }
            }else{
                if(empty($user)){
                    return $this->sendError('This User package is not Exist!');
                }elseif(empty($payment_method)){
                    return $this->sendError('This Payment method is not Exist!');
                }else{
                    return $this->sendError('This Coin package is not Exist!');
                }
            }

        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }


        return $this->sendResponse($coin_purchase, 'Coin Purchase successfully!');

    }

}
