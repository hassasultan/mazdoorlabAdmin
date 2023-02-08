<?php
/*
 * File name: Booking.php
 * Last modified: 2021.09.15 at 13:38:29
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Models;

use App\Casts\OptionCollectionCast;
use App\Casts\TaxCollectionCast;
use App\Events\BookingCreatingEvent;
use Carbon\Carbon;
use Eloquent as Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Date;
use App\Models\User;
use App\Models\Category;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;


/**
 * Class Booking
 * @package App\Models
 * @version January 25, 2021, 9:22 pm UTC
 *
 * @property int id
 * @property User user
 * @property BookingStatus bookingStatus
 * @property Payment payment
 * @property EProvider e_provider
 * @property EService e_service
 * @property Option[] options
 * @property integer quantity
 * @property integer user_id
 * @property integer address_id
 * @property integer booking_status_id
 * @property integer payment_status_id
 * @property Address address
 * @property integer payment_id
 * @property double duration
 * @property Coupon coupon
 * @property Tax[] taxes
 * @property Date booking_at
 * @property Date start_at
 * @property Date ends_at
 * @property string hint
 * @property boolean cancel
 */
class Shop extends Model implements HasMedia
{

    /**
     * Validation rules
     *
     * @var array
     */
    use HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;
    }
    public static $rules = [
        'name' => 'required|string|max:255',
        'email' => 'required|string',
        'phone_number' => 'required',
        'perday_rate' => 'required',
        'address_of_shop' => 'required',
        'pin_point_location' => 'required',
        'user_id' => 'required',
    ];
    
    public $table = 'shops';
    public $fillable = [
        'name',
        'logo',
        'cover',
        'user_id',
        'category_id',
        'username',
        'email',
        'phone',
        'wp_number',
        'address_of_shop',
        'pin_point_location',
        'shop_created',
        'pending',
    ];
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
    public function category()
    {
        return $this->belongsTo(Category::class,'category_id','id');
    }
    
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

    public function getHasMediaAttribute()
    {
        return $this->hasMedia('image') ? true : false;
    }

    
    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
  /*  protected $casts = [
        'e_provider' => EProvider::class,
        'e_service' => EService::class,
        'options' => OptionCollectionCast::class,
        'address' => Address::class,
        'coupon' => Coupon::class,
        'taxes' => TaxCollectionCast::class,
        'booking_status_id' => 'integer',
        'payment_id' => 'integer',
        'duration' => 'double',
        'quantity' => 'integer',
        'user_id' => 'integer',
        'booking_at' => 'datetime:Y-m-d\TH:i:s.uP',
        'start_at' => 'datetime:Y-m-d\TH:i:s.uP',
        'ends_at' => 'datetime:Y-m-d\TH:i:s.uP',
        'hint' => 'string',
        'cancel' => 'boolean'
    ];*/
    /**
     * New Attributes
     *
     * @var array
     */
   /* protected $appends = [
        'custom_fields',
        'duration'
    ];
*/
    /**
     * The event map for the model.
     *
     * @var array
     */
 /*   protected $dispatchesEvents = [
        'creating' => BookingCreatingEvent::class,
        'updating' => BookingCreatingEvent::class,
    ];

    public function getCustomFieldsAttribute()
    {
        $hasCustomField = in_array(static::class, setting('custom_field_models', []));
        if (!$hasCustomField) {
            return [];
        }
        $array = $this->customFieldsValues()
            ->join('custom_fields', 'custom_fields.id', '=', 'custom_field_values.custom_field_id')
            ->where('custom_fields.in_table', '=', true)
            ->get()->toArray();

        return convertToAssoc($array, 'name');
    }*/

   /* public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }

    public function getDurationAttribute(): float
    {
        return $this->getDurationInHours();
    }

    public function getDurationInHours(): float
    {
        if ($this->start_at) {
            if ($this->ends_at) {
                $endAt = new Carbon($this->ends_at);
            } else {
                $endAt = (new Carbon())->now();
            }
            $startAt = new Carbon($this->start_at);
            $hours = $endAt->diffInSeconds($startAt) / 60 / 60;
            $hours = round($hours, 2);
        } else {
            $hours = 0;
        }
        return $hours;
    }
*/
    /**
     * @return BelongsTo
     **/
  /*  public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
*/
    /**
     * @return BelongsTo
     **/
  /*  public function bookingStatus()
    {
        return $this->belongsTo(BookingStatus::class, 'booking_status_id', 'id');
    }*/

    /**
     * @return BelongsTo
     **/
   /* public function payment()
    {
        return $this->belongsTo(Payment::class, 'payment_id', 'id');
    }
*/
 /*   public function getTotal(): float
    {
        $total = $this->getSubtotal();
        $total += $this->getTaxesValue();
        $total += $this->getCouponValue();
        return $total;
    }*/

/*    public function getSubtotal(): float
    {
        if ($this->e_service->price_unit == 'fixed') {
            $total = $this->e_service->getPrice() * ($this->quantity >= 1 ? $this->quantity : 1);
            foreach ($this->options as $option) {
                $total += $option->price * ($this->quantity >= 1 ? $this->quantity : 1);
            }
        } else {
            $total = $this->e_service->getPrice() * $this->getDurationInHours();
            foreach ($this->options as $option) {
                $total += $option->price;
            }
        }
        return $total;
    }
*/
 /*   public function getTaxesValue(): float
    {
        $total = $this->getSubtotal();
        $taxValue = 0;
        foreach ($this->taxes as $tax) {
            if ($tax->type == 'percent') {
                $taxValue += ($total * $tax->value / 100);
            } else {
                $taxValue += $tax->value;
            }
        }
        return $taxValue;
    }*/

  /*  public function getCouponValue(): float
    {
        $total = $this->getSubtotal();
        if (empty($this->coupon)) {
            return 0;
        } else {
            if ($this->coupon->discount_type == 'percent') {
                return -($total * $this->coupon->discount / 100);
            } else {
                return -$this->coupon->discount;
            }
        }
    }*/

}
