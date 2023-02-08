<?php
/*
 * File name: EServiceReviewAPIController.php
 * Last modified: 2021.02.22 at 10:53:38
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Http\Controllers\API;


use App\Criteria\EServiceReviews\EServiceReviewsOfUserCriteria;
use App\Http\Controllers\Controller;
use App\Repositories\EServiceReviewRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Prettus\Repository\Exceptions\RepositoryException;
use Prettus\Validator\Exceptions\ValidatorException;
use App\Models\Media;
use App\Models\Address;
/**
 * Class EServiceReviewController
 * @package App\Http\Controllers\API
 */
class GalleryController extends Controller
{
    public function index(Request $request)
    {
        
    }

    /**
     * Display the specified EServiceReview.
     * GET|HEAD /eServiceReviews/{id}
     *
     * @param int $id
     * @param Request $request
     * @return JsonResponse
     */
    public function show(Request $request)
    {
        $b = Address::get();
        $arr_data = [];
        foreach($b as $a){
            $latitudeFrom = $request->lat;
            $longitudeFrom =$request->lng;
            
            $latitudeTo = $a->latitude;
            $longitudeTo = $a->longitude;
             $theta = $longitudeFrom - $longitudeTo;
            $dist = sin(deg2rad($latitudeFrom)) * sin(deg2rad($latitudeTo)) +  cos(deg2rad($latitudeFrom)) * cos(deg2rad($latitudeTo)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $miles = $dist * 60 * 1.1515;
            $distance = ceil(($miles * 1.609344));
             if($distance < 5){
                      $datas = Media::get();
                     foreach($datas as $data){
                         if($a->user_id == $data['custom_properties']['user_id']){
                         $arr_data[]=$data;
                         }
                     }
            }
        }
       
            if($arr_data)
               {
                return response()->json(
                    [
                        'status' => true,
                        'data' => $arr_data,
                    ]);
               }
               else{
                return response()->json(
                [
                    'status' => false,
                    'message' => 'Data Not Found',
                ]);
               }
    }

   
}
