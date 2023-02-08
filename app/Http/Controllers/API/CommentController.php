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
use App\Models\Comment;

/**
 * Class EServiceReviewController
 * @package App\Http\Controllers\API
 */
class CommentController extends Controller
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
        $b = Comment::where('media_id',$request->media_id)->join('media','comments.media_id','=','media.id')->get();
            if($b)
               {
                return response()->json(
                    [
                        'status' => true,
                        'data' => $b,
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

    /**
     * Store a newly created Review in storage.
     *
     * @param Request $request
     *
     * @return JsonResponse
     */
    public function store(Request $request)
    {
    $c = new Comment();
    $c->commenter_id = $request->commenter_id;
    $c->provider_id = $request->provider_id;
    $c->media_id = $request->media_id;
    $c->comment_text = $request->comment_text;
     $done = $c->save();
     if($done){
        return response()->json(
            [
                'status' => 'true',
                'message' => 'comment is successfully added',
            ]);

     }
     else
     {
        return response()->json(
            [
                'status' => 'false',
                'message' => 'Something is wrong',
            ]);

     }
    }
   
}
