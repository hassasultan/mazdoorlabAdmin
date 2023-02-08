<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PremiumBannerPackage;
use App\Models\User;
use Illuminate\Validation\ValidationException;
use App\Repositories\CustomFieldRepository;
use App\Repositories\PremiumBannerPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;




class PremiumBannerPackageAPIController extends Controller
{

    /**
     * @var PremiumBannerPackageRepository
     */
    private $premiumBannerPackageRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(PremiumBannerPackageRepository $premiumBannerPackageRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->premiumBannerPackageRepository = $premiumBannerPackageRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }

    
    public function index ()
    {
        if(isset(request()->user_id) && request()->user_id){
            $user = User::find(request()->user_id);
            if($user){
                $data = DB::table('premium_banner_packages')
                    ->select('premium_banner_packages.*',
                        DB::raw("(SELECT COUNT(banner_purchases.premium_banner_id) FROM banner_purchases
                                WHERE banner_purchases.premium_banner_id = premium_banner_packages.id
                                AND banner_purchases.user_id = ".request()->user_id.")
                                as purchase_status"))
                    ->where('premium_banner_packages.status', 'publish')
                    ->get();

                if(sizeof($data)>0){
                    return $this->sendResponse($data, 'Premium Banner List');
                }else{
                    return $this->sendError('There is no premium banner exist!');
                }
            } else{
                return $this->sendError('User not found!');
            }
        } else{
            return $this->sendError('User id is required!');
        }
    }

    public function create(Request $request)
    {
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumBannerPackageRepository->model());
            try {
                $this->validate($request, [
                    'name' => 'required|max:127|unique:premium_banner_packages,name',
                    'description'=>'required',
                    'coins'=>'required',
                    'expire'=>'required',
                    'status'=>'required',
                    'image'=>'required'
                ]);
                $premium_package = new PremiumBannerPackage();
                if (isset($request->image) && $request->image) {
                    $image = DB::table('uploads')
                        ->leftJoin('media','media.model_id','uploads.id')
                        ->where('uploads.uuid', $request->image)
                        ->first();
                    if($image){
                        $image_url = '/storage/app/public/'.$image->id.'/'.$image->file_name;
                        $premium_package->image = $image_url;
                    }
                }
                $premium_package->name = $request->name;
                $premium_package->description = $request->description;
                $premium_package->coins = $request->coins;
                $premium_package->expire = $request->expire;
                $premium_package->status = $request->status;
                $premium_package->save();
                $premium_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            }catch (ValidationException $e) {
                return $this->sendError(array_values($e->errors()));
            } catch (Exception $e) {
                return $this->sendError($e->getMessage(), 200);
            }

            return $this->sendResponse($premium_package, 'Premium Banner added successfully!');
    }

    public function show($id)
    {
        $shop = PremiumBannerPackage::find($id);
        if($shop){
            return $this->sendResponse($shop, '');
        }else{
            return $this->sendError('Premium Banner not Exist!');
        }
    }
}
