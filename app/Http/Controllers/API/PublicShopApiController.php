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
use App\Models\Profile;
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
use SimpleSoftwareIO\QrCode\Facades\QrCode;
/**
 * Class CategoryController
 * @package App\Http\Controllers\API
 */
class PublicShopApiController extends Controller
{
  public function index (Request $req,$id)
  {
  

          //return Shop::find($id);
          
           $data=  Shop::where('shops.id',$id)->rightjoin('users', 'users.id', '=', 'shops.user_id')->get();
            return $data;
      
  }
  
  public function create(Request $req)
  {
    try {
             $this->validate($req, [
            'name' => 'required',
            'phone_number' => 'required',
            'photo' => 'required',
            'cover' => 'required',
            
        ]);
                 
                 $data = new User();
                 $data->name = $req->input('name');
                 $data->phone_number = $req->input('phone_number');
                if ($req->hasFile('photo') &&  $req->hasFile('cover'))
                {
                 //coverupload
                  $file = $req->file('photo');
                  $ext = $file->getClientOriginalExtension();
                  $filename = 'user_photo'.time().'.'.$ext;
                  $file->move('public/uploads',$filename);
                  $data->photo = $filename;
                  
                  //logoupload
                  $file = $req->file('cover');
                  $exts = $file->getClientOriginalExtension();
                  $filenames = 'user_cover'.time().'.'.$exts;
                  $file->move('public/uploads',$filenames);
                  $data->cover = $filenames;
                }
              
                 $data->save();

                 
                 
        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        } 
                 
                
    return $this->sendResponse($data, 'User retrieved successfully');

  }
  
  public function edit($id)
    {
        $data = User::find($id);
        return $data;
    }

 public function update(Request $req, $id)
{
      try {
             $this->validate($req, [
            'name' => 'required',
            'phone_number' => 'required',
            'photo' => 'required',
            'cover' => 'required',
            
        ]);
                $data = new User();
                $data = User::find($id);
               
         $data->name = $req->input('name');
        $data->phone_number = $req->input('phone_number');
          if ($req->hasFile('photo') &&  $req->hasFile('cover'))
                {
                 //coverupload
                  $file = $req->file('photo');
                  $ext = $file->getClientOriginalExtension();
                  $filename = 'user_photo'.time().'.'.$ext;
                  $file->move('public/uploads',$filename);
                  $data->photo = $filename;
                  
                  //logoupload
                  $file = $req->file('cover');
                  $exts = $file->getClientOriginalExtension();
                  $filenames = 'user_cover'.time().'.'.$exts;
                  $file->move('public/uploads',$filenames);
                  $data->cover = $filenames;
                }
                
              
                
     
     $data->update();
          
      }
      catch (ValidationException $e) {
        return $this->sendError(array_values($e->errors()));
    } catch (Exception $e) {
        return $this->sendError($e->getMessage(), 200);
    } 
     return $this->sendResponse($data, 'User update successfully');
}
  

}
