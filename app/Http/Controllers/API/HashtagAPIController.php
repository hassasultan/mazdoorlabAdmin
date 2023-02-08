<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\BannerPackageHash;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;


class HashtagAPIController extends Controller
{
    public function index ()
    {
        $shop = BannerPackageHash::all();
        if(sizeof($shop)>0){
            return ["success"=>"true","data"=>$shop];
        }else{
            return $this->sendError('There is not Banner Package Hash!');
        }
    }

    public function create(Request $req)
    {
        try {
            $this->validate($req, [
                'media_id' => 'required',
                'name' => 'required',
                'description'=>'required',
                'status'=>'required',
            ]);

            $media = Media::find($req->media_id);

            if($media){
                $banner_hash = new BannerPackageHash();
                $banner_hash->media_id = $req->input('media_id');
                $banner_hash->name = $req->input('name');
                $banner_hash->description = $req->input('description');
                $banner_hash->status = $req->input('status');
                $banner_hash->save();
            }else{
                return $this->sendError('This media is not Exist!');
            }
            

        } catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }


        return $this->sendResponse($banner_hash, 'Banner Hash save successfully!');

    }


    public function show($id)
    {
        $shop = BannerPackageHash::where('media_id',$id)->get();
        if(sizeof($shop)>0){
            return $this->sendResponse($shop, '');
        }else{
            return $this->sendError('There is no Hash against this media!');
        }
    }
}
