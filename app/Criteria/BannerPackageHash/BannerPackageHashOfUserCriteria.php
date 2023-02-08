<?php
/*
 * File name: EServicesOfUserCriteria.php
 * Last modified: 2021.03.23 at 11:38:55
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Criteria\BannerPackageHash;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class EServicesOfUserCriteria.
 *
 * @package namespace App\Criteria\EServices;
 */
class BannerPackageHashOfUserCriteria implements CriteriaInterface
{
    /**
     * @var int
     */
    private $userId;

    /**
     * EServicesOfUserCriteria constructor.
     */
    public function __construct($userId)
    {
        $this->userId = $userId;
    }

    /**
     * Apply criteria in query repository
     *
     * @param string $model
     * @param RepositoryInterface $repository
     *
     * @return mixed
     */
    public function apply($model, RepositoryInterface $repository)
    {
        return $model->select('banner_package_hashes.*')->groupBy('banner_package_hashes.id');
    }
}
