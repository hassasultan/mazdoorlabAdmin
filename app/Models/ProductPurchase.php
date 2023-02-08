<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductPurchase extends Model
{

    public $translatable = [
        'user_id',
        'product_id',
        'payment_method_id',
        'amount',
        'quantity'
    ];

    public $table = 'product_purchases';

    public $fillable = [
        'user_id',
        'product_id',
        'payment_method_id',
        'amount',
        'quantity'
    ];
}
