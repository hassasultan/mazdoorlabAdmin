<?php
/*
 * File name: CategoryRepository.php
 * Last modified: 2021.01.31 at 14:03:57
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Repositories;

use App\Models\CoinPackage;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class CoinPackageRepository
 * @package App\Repositories
 * @version January 19, 2021, 2:04 pm UTC
 *
 * @method Category findWithoutFail($id, $columns = ['*'])
 * @method Category find($id, $columns = ['*'])
 * @method Category first($columns = ['*'])
 */
class CoinPackageRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description',
        'coins',
        'amount',
        'status',
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return CoinPackage::class;
    }
}
