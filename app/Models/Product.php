<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;

class Product extends Model implements HasMedia
{
    use HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;
    }
    public static function rules(){
        return [
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'discount' => 'required'
        ];
    }
    public $translatable = [
        'name',
        'description'
    ];
    public $table = 'products';
    public $fillable = [
        'name',
        'category_id',
        'description',
        'status',
        'price',
        'discount'
    ];
    public function registerMediaConversions(Media $media = null)
    {
        $this->addMediaConversion('thumb')
            ->fit(Manipulations::FIT_CROP, 200, 200)
            ->sharpen(10);

        $this->addMediaConversion('icon')
            ->fit(Manipulations::FIT_CROP, 100, 100)
            ->sharpen(10);
    }

    /**
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
    public function getFirstMediaUrl($collectionName = 'default', $conversion = '')
    {
        $url = $this->getFirstMediaUrlTrait($collectionName);
        $array = explode('.', $url);
        $extension = strtolower(end($array));
        if (in_array($extension, config('medialibrary.extensions_has_thumb'))) {
            return asset($this->getFirstMediaUrlTrait($collectionName, $conversion));
        } else {
            return asset(config('medialibrary.icons_folder') . '/' . $extension . '.png');
        }
    }
    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }
    public function getHasMediaAttribute()
    {
        return $this->hasMedia('image') ? true : false;
    }

    public function product_category()
    {
        return $this->belongsTo(ProductCategory::class,'category_id');
    }
}
