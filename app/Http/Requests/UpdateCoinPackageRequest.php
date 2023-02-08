<?php
/*
 * File name: CreateAddressRequest.php
 * Last modified: 2021.01.16 at 21:43:14
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Http\Requests;

use App\Models\CoinPackage;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateCoinPackageRequest extends FormRequest
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $id = Request::segment(2);
        return CoinPackage::rules($id);
    }
}
