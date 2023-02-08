<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\BannerPackage;
use Illuminate\Http\Request;
use App\Http\Requests\CreateBannerPackageRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\BannerPackageRepository;
use App\Repositories\UploadRepository;
use Prettus\Validator\Exceptions\ValidatorException;
use Illuminate\Validation\ValidationException;





class BannerPackageAPIController extends Controller
{

    /**
     * @var BannerPackageRepository
     */
    private $bannerPackageRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(BannerPackageRepository $bannerPackageRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->bannerPackageRepository = $bannerPackageRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }


    public function index ()
    {
        $banner_package = BannerPackage::all();
        if(sizeof($banner_package)>0){
            return ["success"=>"true","data"=>$banner_package];
        }else{
            return $this->sendError('There is no Banner Package!');
        }
    }

    public function create(Request $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageRepository->model());
        try {
            $this->validate($request, [
                'name' => 'required|unique:banner_packages,name',
                'description' => 'required',
                'status'=>'required'
            ]);

            $banner_package = $this->bannerPackageRepository->create($input);
            $banner_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                foreach ($input['image'] as $fileUuid) {
                    $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($banner_package, 'image');
                }
            }
        }catch (ValidationException $e) {
            return $this->sendError(array_values($e->errors()));
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), 200);
        }

        return $this->sendResponse($banner_package, 'Banner Package added successfully!');
    }

    public function show($id)
    {
        $banner_package = BannerPackage::find($id);

        $media_urls = [];
        if(isset($banner_package) && $banner_package->hasMedia('image')){
            foreach ($banner_package->getMedia('image') as $media){
                $media_urls[] = $media->getUrl();
            }
        }

        if($banner_package){
            return ["success"=>"true","data"=>$banner_package,"media_urls"=>$media_urls];
        }else{
            return $this->sendError('There is no Banner Package Exist!');
        }
    }
}
