<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BannerPurchase extends Model
{

    public $translatable = [
        'user_id',
        'premium_banner_id',
        'coins'
    ];

    public $table = 'banner_purchases';

    public $fillable = [
        'user_id',
        'premium_banner_id',
        'coins'
    ];
}
