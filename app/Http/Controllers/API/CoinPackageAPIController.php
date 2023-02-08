<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\CoinPackage;
use App\Repositories\CustomFieldRepository;
use App\Repositories\CoinPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;



class CoinPackageAPIController extends Controller
{
    /**
     * @var CoinPackageRepository
     */
    private $coinPackageRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(CoinPackageRepository $coinPackageRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->coinPackageRepository = $coinPackageRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }

    public function index ()
    {
        $shop = CoinPackage::all();
        if(sizeof($shop)>0){
            return ["success"=>"true","data"=>$shop];
        }else{
            return $this->sendError('There is not Premium Coin Package!');
        }
    }

    public function create(Request $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->coinPackageRepository->model());
            try {
                $this->validate($request, [
                    'name' => 'required',
                    'description'=>'required',
                    'coins'=>'required',
                    'amount'=>'required',
                    'status'=>'required'
                ]);
                $category = $this->coinPackageRepository->create($input);
                $category->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            }catch (ValidationException $e) {
                return $this->sendError(array_values($e->errors()));
            } catch (Exception $e) {
                return $this->sendError($e->getMessage(), 200);
            }
            return $this->sendResponse($category, 'Premium Coin added successfully!');
    }

    public function show($id)
    {
        $shop = CoinPackage::find($id);
        if($shop){
            return ["success"=>"true","data"=>$shop];
        }else{
            return $this->sendError('Premium Coin Package is not Exist!');
        }
    }
}
