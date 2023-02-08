<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CoinPurchase extends Model
{
    public $translatable = [
        'user_id',
        'coins_package_id',
        'payment_method_id',
        'amount'
    ];

    public $table = 'coin_purchases';

    public $fillable = [
        'user_id',
        'coins_package_id',
        'payment_method_id',
        'amount'
    ];
}
