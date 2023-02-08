<?php
/*
 * File name: CategoryAPIController.php
 * Last modified: 2021.03.24 at 21:33:26
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Http\Controllers\API;


use App\Criteria\Categories\NearCriteria;
use App\Criteria\Categories\ParentCriteria;
use App\Http\Controllers\Controller;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Support\Facades\File;
use App\Repositories\CategoryRepository; 
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;  
use Prettus\Repository\Criteria\RequestCriteria;
use Prettus\Repository\Exceptions\RepositoryException;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Validator;
use App\Repositories\UploadRepository;
use Illuminate\Support\Facades\DB;



/**
 * Class CategoryController
 * @package App\Http\Controllers\API
 */

class ShopAPIController extends Controller
{
  /**
     * @var UploadRepository
  */
  private $uploadRepository;

  public function __construct(UploadRepository $uploadRepo)
  {
      parent::__construct();
      $this->uploadRepository = $uploadRepo;
  }

  public function index ()
  {
      return $shop = Shop::with('user','category')->get();
      
  }
  
public function create(Request $req)
  {
     try {
            $this->validate($req, [
                'sname' => 'required',
                'email' => 'required|email',
                'username' => 'required',
                'phone' => 'required',
                'wp_number' => 'required',
                'perday_rate' => 'required',
                'address_of_shop' => 'required',
                'pin_point_location' => 'required',
                'shop_created' => 'required',
                'pending' => 'required',
                'user_id' => 'required',
                'category_id' => 'required',
                // 'subcat_id' => 'required',
            ]);
                 
                 $shop = new Shop();

                 $shop->sname = $req->input('sname');
                 $shop->email = $req->input('email');
                 $shop->phone = $req->input('phone');
                 $shop->category_id = $req->input('category_id');
                 if($req->has('subcat_id'))
                 {
                    $shop->subcat_id = $req->input('subcat_id');
                 }
                 

                 if (isset($req->cover) && $req->cover) {
                    $cover = DB::table('uploads')
                        ->leftJoin('media','media.model_id','uploads.id')
                        ->where('uploads.uuid', $req->cover)
                        ->first();
                    if($cover){
                        $cover_url = '/storage/app/public/'.$cover->id.'/'.$cover->file_name;
                        $shop->cover = $cover_url;
                    }
                 }
                if (isset($req->logo) && $req->logo) {
                    $logo = DB::table('uploads')
                        ->leftJoin('media','media.model_id','uploads.id')
                        ->where('uploads.uuid', $req->logo)
                        ->first();
                    if($logo){
                        $logo_url = '/storage/app/public/'.$logo->id.'/'.$logo->file_name;
                        $shop->logo = $logo_url;
                    }
                 }


                 $shop->user_id = $req->input('user_id');
                 $shop->username = $req->input('username');
                 $shop->wp_number = $req->input('wp_number');
                 $shop->perday_rate = $req->input('perday_rate');
                 $shop->address_of_shop = $req->input('address_of_shop');
                 $shop->pin_point_location = $req->input('pin_point_location');
                 $shop->shop_created = $req->input('shop_created');
                 $shop->pending = $req->input('pending');
                 $shop->save();
                 //return $shop;
                 
                 
        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        } 
                 
                
    return $this->sendResponse($shop, 'Shop retrieved successfully');

  }
  
 public function edit($id)
{
    $shop = Shop::find($id);
    return $shop;
}

 public function update(Request $req, $id)
{
      try {
             $this->validate($req, [
            'sname' => 'required',
            'email' => 'required|email',
            'username' => 'required',
            'phone' => 'required',
            'wp_number' => 'required',
            'perday_rate' => 'required',
            'address_of_shop' => 'required',
            'pin_point_location' => 'required',
            'shop_created' => 'required',
            'pending' => 'required',
            'user_id' => 'required',
        ]);
        $shop = Shop::find($id);
        if (isset($req->cover) && $req->cover) {
            $cover = DB::table('uploads')
                        ->leftJoin('media','media.model_id','uploads.id')
                        ->where('uploads.uuid', $req->cover)
                        ->first();
            if($cover){
                $cover_url = '/storage/app/public/'.$cover->id.'/'.$cover->file_name;
                $shop->cover = $cover_url;
            }
        }
        if (isset($req->logo) && $req->logo) {
            $logo = DB::table('uploads')
                        ->leftJoin('media','media.model_id','uploads.id')
                        ->where('uploads.uuid', $req->logo)
                        ->first();
            if($logo){
                $logo_url = '/storage/app/public/'.$logo->id.'/'.$logo->file_name;
                $shop->logo = $logo_url;
            }
        }          
          
          

         $shop->sname = $req->input('sname');
         $shop->email = $req->input('email');
         $shop->phone = $req->input('phone');
         $shop->user_id = $req->input('user_id');
         $shop->username = $req->input('username');
         $shop->wp_number = $req->input('wp_number');
         $shop->perday_rate = $req->input('perday_rate');
         $shop->address_of_shop = $req->input('address_of_shop');
         $shop->pin_point_location = $req->input('pin_point_location');
         $shop->shop_created = $req->input('shop_created');
         $shop->pending = $req->input('pending');
         $shop->update();
          
      }
      catch (ValidationException $e) {
        return $this->sendError(array_values($e->errors()));
    } catch (Exception $e) {
        return $this->sendError($e->getMessage(), 200);
    } 
     return $this->sendResponse($shop, 'Shop update successfully');
}

public function destroy($id)
{
   /*  $shop = Shop::where('id',$id)->delete();
           if($shop)
           {
               return ["shop"=>"Shop has been deleted"];
           }
           else{
               return ["shop"=>"Operation Failed"];
           }*/
            $shop = Shop::find($id);
        $logopath = 'public/uploads'.$shop->logo;
        $coverpath = 'public/uploads'.$shop->cover;
           if (File::exists($logopath))
           {
               File::delete($logopath);
           }
           if (File::exists($coverpath))
           {
               File::delete($coverpath);
           }
           $shop->delete();
           if($shop)
           {
               return ["shop"=>"Shop has been deleted"];
           }
           else{
               return ["shop"=>"Operation Failed"];
           }
}

public function getShop($id)
{
    $shop = Shop::find($id);
    if($shop){
        return $this->sendResponse($shop, '');
    }else{
        return $this->sendError('shop not Exist!');
    }
}
 public function generate ($id)
    {
        $shop = Shop::findOrFail($id);
        $qrcode = QrCode::size(400)->generate( url('product/'.$prod_slug));
        return $qrcode;

           
    }

}
