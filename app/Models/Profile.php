<?php
/*
 * File name: User.php
 * Last modified: 2021.06.28 at 23:44:43
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Cashier\Billable;
use Spatie\Image\Exceptions\InvalidManipulation;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\Permission\Traits\HasRoles;

/**
 * Class User
 * @package App\Models
 * @version July 10, 2018, 11:44 am UTC
 *
 * @property int id
 * @property string name
 * @property string email
 * @property string phone_number
 * @property string phone_verified_at
 * @property string password
 * @property string api_token
 * @property string device_token
 */
class Profile extends Authenticatable implements HasMedia
{
    use Notifiable;
    use Billable;
    use HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;
    }
    use HasRoles;

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'email' => 'required|string|max:255|unique:users',
        'phone_number' => 'required|max:255|unique:users',
        'password' => 'required',
    ];

    public $table = 'profile';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public $fillable = [
        'user_id',
        'name',
        'username',
        'email',
        'phone_number',
        'photo',
        'cover',
        
    ];
    public function users()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
  /*  protected $casts = [
        'name' => 'string',
        'email' => 'string',
        'phone_number' => 'string',
        'password' => 'string',
        'email_verified_at' => 'datetime',
        'phone_verified_at' => 'datetime',
        'api_token' => 'string',
        'device_token' => 'string',
        'remember_token' => 'string'
    ];*/
    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [
        'custom_fields',
        'has_media'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Route notifications for the FCM channel.
     *
     * @param \Illuminate\Notifications\Notification $notification
     * @return string|null
     */

    /**
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
 

}
