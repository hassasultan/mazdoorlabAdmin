<?php

namespace App\Http\Controllers;

use App\Criteria\Product\ProductOfUserCriteria;
use App\Models\ProductCategory;
use Illuminate\Http\Request;
use App\DataTables\ProductDataTable;
use App\Http\Requests\CreateProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\ProductRepository;
use App\Repositories\UploadRepository;
use App\Models\Product;
use Prettus\Validator\Exceptions\ValidatorException;
use Laracasts\Flash\Flash;
use Exception;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class ProductController extends Controller
{
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

    public function __construct(ProductRepository $productRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->productRepository = $productRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }
    /**
     * Display a listing of the ProductCategory.
     *
     * @param ProductCategoryDataTable $productCategoryDataTable
     * @return mixed
     */
    public function index(ProductDataTable $productDataTable)
    {
        return $productDataTable->render('product.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->productRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
            $html = generateCustomField($customFields);
        }

        $product_categories = ProductCategory::where('status', 'publish')->get();
        $category_name = [];
        foreach($product_categories as $categories){
            $category_name[$categories->id] = $categories->name;
        }

        return view('product.create',compact('category_name'))->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProductRequest $request)
    {
        if (Product::where(["category_id"=>$request->category_id,"name"=>$request->name])->exists()) {
            Flash::error('Product Already exist against this Category');
            return redirect(route('products.create'));
        }else{
            $input = $request->all();
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
            try {
                $category = $this->productRepository->create($input);
                $category->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
                if (isset($input['image']) && $input['image']) {
                    $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($category, 'image');
                }
            } catch (ValidatorException $e) {
                Flash::error($e->getMessage());
            }

            Flash::success(__('lang.saved_successfully', ['operator' => __('lang.product_category')]));

            return redirect(route('products.index'));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->productRepository->pushCriteria(new ProductOfUserCriteria(auth()->id()));
        $product = $this->productRepository->findWithoutFail($id);
        $stock = DB::table('stocks')->where('product_id', $id)->first();

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }

        return view('product.show')->with('product', $product)->with('stock', $stock);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = $this->productRepository->findWithoutFail($id);
        if (empty($product)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.product_category')]));
            return redirect(route('products.index'));
        }
        $customFieldsValues = $product->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
        $hasCustomField = in_array($this->productRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        $product_category = ProductCategory::where('status', 'publish')->get();
        $product = Product::find($id);
        $category_name = [];
        foreach($product_category as $category){
            $category_name[$category->id] = $category->name;
        }
        return view('product.edit')->with('product', $product)->with('category_name', $category_name)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductRequest $request, $id)
    {
        $product = $this->productRepository->findWithoutFail($id);

        if (empty($product)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.product_category')]));
            return redirect(route('products.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productRepository->model());
        try {
            if (($request->existing_categoryId ==  $request->category_id) && ($request->name ==  $request->existing_name)) {
            $product = $this->productRepository->update($input, $id);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($product, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $product->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
            }else{
                if (Product::where(["category_id"=>$request->category_id,"name"=>$request->name])->exists()){
                    Flash::error('Product Already exist against this Category');
                    return redirect(route('products.create'));
                }else{
                    $product = $this->productRepository->update($input, $id);
                    if (isset($input['image']) && $input['image']) {
                        $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                        $mediaItem = $cacheUpload->getMedia('image')->first();
                        $mediaItem->copy($product, 'image');
                    }
                    foreach (getCustomFieldsValues($customFields, $request) as $value) {
                        $product->customFieldsValues()
                            ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
                    }
                }
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.product_category')]));

        return redirect(route('products.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = $this->productRepository->findWithoutFail($id);

        if (empty($product)) {
            Flash::error('Product not found');
            return redirect(route('products.index'));
        }
        $this->productRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.product_category')]));
        return redirect(route('products.index'));
    }

    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $category = $this->productRepository->findWithoutFail($input['id']);
        try {
            if ($category->hasMedia($input['collection'])) {
                $category->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }

    public function addStock(Request $request){
        $input = $request->all();
        if($input){
            $stock = DB::table('stocks')->where('product_id', $input['product_id'])->first();
        }else{
            Flash::error('Stock Not Added!');
            return redirect(Url('products/'.$input['product_id']));
        }
        if(isset($stock) && $stock){
            DB::table('stocks')
                ->where('product_id', $stock->product_id)
                ->update([
                    'quantity' => $stock->quantity + $input['product_stock'],
                    'updated_at' => Carbon::now(),
                ]);
        }else {
            DB::table('stocks')->insert(
                [
                    'product_id' => $input['product_id'], 
                    'quantity' => $input['product_stock'], 
                    'created_at'=> Carbon::now(),
                    'updated_at'=> Carbon::now(),
                ]
            );
        }
        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.stock')]));
        return redirect(Url('products/'.$input['product_id']));
    }
}
