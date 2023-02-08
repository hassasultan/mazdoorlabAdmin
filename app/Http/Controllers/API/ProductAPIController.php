<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Repositories\CustomFieldRepository;
use App\Repositories\ProductRepository;
use Illuminate\Http\Request;
use App\Repositories\UploadRepository;
use App\Models\Product;
use Illuminate\Validation\ValidationException;

class ProductAPIController extends Controller
{
    /**
     * @var Product
     */
    private $product;

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

    public function __construct(Product $pro, ProductRepository $productRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->productRepository = $productRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->product = $pro;

    }

    public function index ()
    {
        $product = $this->product->all();
        return ["success"=>"true","data"=>$product];
    }

    public function create(Request $request)
    {

        if (Product::where(["category_id"=>$request->category_id,"name"=>$request->name])->exists()) {
            return $this->sendError('Product Already exist against this Category!');
        }else{
            $input = $request->all();
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
            try {
                $this->validate($request, [
                    'category_id' => 'required',
                    'name' => 'required',
                    'description'=>'required',
                    'status'=>'required',
                    'price'=>'required',
                    'discount'=>'required'
                ]);
                $category = $this->productRepository->create($input);
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

            return $this->sendResponse($category, 'Product added successfully!');
        }
    }

    public function show($id)
    {
        $product = $this->product->find($id);

        $media_urls = [];
        if(isset($product) && $product->hasMedia('image')){
            foreach ($product->getMedia('image') as $media){
                $media_urls[] = $media->getUrl();
            }
        }

        if($product){
            return ["success"=>"true","data"=>$product,"media_urls"=>$media_urls];
        }else{
            return $this->sendError('This Product is not Exist!');
        }
    }
}
