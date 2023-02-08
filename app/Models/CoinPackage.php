<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CoinPackage extends Model
{
//    rules
    public static function rules($id = null){
        return [
            'name' => 'required|max:127|unique:coin_packages,name,'.$id,
            'description' => 'required',
            'coins' => 'required',
            'amount' => 'required',
        ];
    }

//    translateable
    public $translatable = [
        'name',
        'description',
        'coins',
        'amount',
        'status',
    ];

//    table
    public $table = 'coin_packages';

//    fillable fields
    public $fillable = [
        'name',
        'description',
        'coins',
        'amount',
        'status'
    ];

//    custom fields
    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }
}
