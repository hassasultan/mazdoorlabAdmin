<?php
/*
 * File name: CategoryRepository.php
 * Last modified: 2021.01.31 at 14:03:57
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Repositories;

use App\Models\PremiumGalleryPackage;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class CategoryRepository
 * @package App\Repositories
 * @version January 19, 2021, 2:04 pm UTC
 *
 * @method Package findWithoutFail($id, $columns = ['*'])
 * @method Package find($id, $columns = ['*'])
 * @method Package first($columns = ['*'])
 */
class PremiumGalleryPackageRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description',
        'image',
        'coins',
        'expire',
        'status',
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return PremiumGalleryPackage::class;
    }
}
