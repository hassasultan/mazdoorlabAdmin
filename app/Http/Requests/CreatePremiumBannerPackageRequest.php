<?php
/*
 * File name: CreateAddressRequest.php
 * Last modified: 2021.01.16 at 21:43:14
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Http\Requests;

use App\Models\PremiumBannerPackage;
use Illuminate\Foundation\Http\FormRequest;

class CreatePremiumBannerPackageRequest extends FormRequest
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
        return PremiumBannerPackage::rules();
    }
}
