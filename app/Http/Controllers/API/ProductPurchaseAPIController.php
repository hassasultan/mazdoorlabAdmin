<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\ProductPurchase;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;



class ProductPurchaseAPIController extends Controller
{
    // product
    public $product;
    // payment
    public $paymethod;
    // product category
    public $proCategory;
    // product purchase
    public $proPurchase;

    public function __construct(Product $pro,PaymentMethod $pay,ProductCategory $proCat,ProductPurchase $proPurch){
        $this->product = $pro;
        $this->paymethod = $pay;
        $this->proCategory = $proCat;
        $this->proPurchase = $proPurch;
    }

    public function index (Request $request)
    {
            $shop = DB::table('product_purchases')
                        ->join('users','product_purchases.user_id','=','users.id')
                        ->join('products','product_purchases.product_id','=','products.id')
                        ->join('payment_methods','product_purchases.payment_method_id','=','payment_methods.id')
                        ->select('product_purchases.id','users.name as user_name','products.name as product_name','payment_methods.name as payment_name','product_purchases.amount','product_purchases.quantity','product_purchases.created_at','product_purchases.updated_at')
                        ->where('user_id',$request->user_id)
                        ->get();
            if(sizeof($shop)>0){
                return ["success"=>"true","data"=>$shop];
            }else{
                return $this->sendError('There is no Product!');
            }
    }

    public function create(Request $req)
    {
        try {
            $this->validate($req, [
                'user_id' => 'required',
                'product_id' => 'required',
                'payment_method_id'=>'required',
                'amount'=>'required',
                'quantity'=>'required',
            ]);

            $product = $this->product->find($req->product_id);
            $payment_method = $this->paymethod->find($req->payment_method_id);
            if($product){
                $product_category = $this->proCategory->find($product->category_id);
            }else{
                return $this->sendError('This Product is not Exist!');
            }

            if($payment_method){
                if($product->status == 'publish' && $product_category->status == 'publish') {
                    $this->proPurchase->user_id = $req->input('user_id');
                    $this->proPurchase->product_id = $req->input('product_id');
                    $this->proPurchase->payment_method_id = $req->input('payment_method_id');
                    $this->proPurchase->amount = $req->input('amount');
                    $this->proPurchase->quantity = $req->input('quantity');
                    $this->proPurchase->save();
                }else{
                    return $this->sendError('This Product and Product Category is not published, please select another one!');
                }
            }else{
                return $this->sendError('This Payment method is not Exist!');
            }
            

        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }


        return $this->sendResponse($this->proPurchase, 'Product Purchase successfully!');
    }

}
