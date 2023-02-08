<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PremiumGalleryPackage;
use App\Repositories\CustomFieldRepository;
use App\Repositories\PremiumGalleryPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;



class PremiumGalleryPackageAPIController extends Controller
{
    
    /**
     * @var PremiumGalleryPackageRepository
     */
    private $premiumGalleryPackageRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(PremiumGalleryPackageRepository $premiumGalleryPackageRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->premiumGalleryPackageRepository = $premiumGalleryPackageRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }
    
    public function index ()
    {
        $shop = PremiumGalleryPackage::all();
        if(sizeof($shop)>0){
            return ["success"=>"true","data"=>$shop];
        }else{
            return $this->sendError('There is not Premium Gallery Package!');
        }
    }
    
    public function create(Request $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumGalleryPackageRepository->model());
            try {
                $this->validate($request, [
                    'name' => 'required',
                    'description'=>'required',
                    'coins'=>'required',
                    'expire'=>'required',
                    'status'=>'required'
                ]);
                $premium_package = $this->premiumGalleryPackageRepository->create($input);
                $premium_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
                if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                    foreach ($input['image'] as $fileUuid) {
                        $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                        $mediaItem = $cacheUpload->getMedia('image')->first();
                        $mediaItem->copy($premium_package, 'image');
                    }
                }
            }catch (ValidationException $e) {
                return $this->sendError(array_values($e->errors()));
            } catch (Exception $e) {
                return $this->sendError($e->getMessage(), 200);
            }

            return $this->sendResponse($premium_package, 'Premium Gallery added successfully!');
    }

    public function show($id)
    {
        $shop = PremiumGalleryPackage::find($id);

        $media_urls = [];
        if(isset($shop) && $shop->hasMedia('image')){
            foreach ($shop->getMedia('image') as $media){
                $media_urls[] = $media->getUrl();
            }
        }

        if($shop){
            return ["success"=>"true","data"=>$shop,"media_urls"=>$media_urls];
        }else{
            return $this->sendError('Premium Gallery Package is not Exist!');
        }
    }
}
