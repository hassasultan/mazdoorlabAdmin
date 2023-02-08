<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PremiumGalleryPurchase extends Model
{
    public $translatable = [
        'user_id',
        'premium_gallery_id',
        'coins'
    ];

    public $table = 'premium_gallery_purchases';

    public $fillable = [
        'user_id',
        'premium_gallery_id',
        'coins'
    ];
}
