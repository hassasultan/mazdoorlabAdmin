<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Repositories\ProductCategoryRepository;
use App\Repositories\UploadRepository;
use App\Repositories\CustomFieldRepository;
use App\Models\ProductCategory;
use Illuminate\Validation\ValidationException;

class ProductCategoryAPIController extends Controller
{
    /**
     * @var product
     */
    private $product;

    /**
     * @var proCategory
     */
    private $proCategory;

    /**
     * @var ProductCategoryRepository
     */
    private $productCategoryRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(ProductCategory $proCat, Product $pro, ProductCategoryRepository $productCategoryRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->productCategoryRepository = $productCategoryRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->proCategory = $proCat;
        $this->product = $pro;

    }

    public function index ()
    {
        $product_category = $this->proCategory->all();
        return ["success"=>"true","data"=>$product_category];
    }

    public function create(Request $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productCategoryRepository->model());
            try {
                $this->validate($request, [
                    'name' => 'required',
                    'description'=>'required',
                    'status'=>'required'
                ]);
                $category = $this->productCategoryRepository->create($input);
                $category->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
                if (isset($input['image']) && $input['image']) {
                    $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($category, 'image');
                }
            }catch (ValidationException $e) {
                return $this->sendError(array_values($e->errors()));
            } catch (Exception $e) {
                return $this->sendError($e->getMessage(), 200);
            }

            return $this->sendResponse($category, 'Product Category added successfully!');
    }

    public function show($id)
    {
        $product_category = $this->proCategory->find($id);

        $media_urls = [];
        if(isset($product_category) && $product_category->hasMedia('image')){
            foreach ($product_category->getMedia('image') as $media){
                $media_urls[] = $media->getUrl();
            }
        }

        if($product_category){
            return ["success"=>"true","data"=>$product_category,"media_urls"=>$media_urls];
        }else{
            return $this->sendError('This Product Category is not Exist!');
        }
    }

    public function get_categoryProducts($id)
    {
        $product = $this->product->where('category_id',$id)->get();
        if(sizeof($product)>0){
            return ["success"=>"true","data"=>$product];
        }else{
            return $this->sendError('There is no Product against this category!');
        }
    }
}
