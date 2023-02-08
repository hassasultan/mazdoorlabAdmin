<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use App\DataTables\ProductCategoryDataTable;
use App\Http\Requests\CreateProductCategoryRequest;
use App\Http\Requests\UpdateProductCategoryRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\ProductCategoryRepository;
use App\Repositories\UploadRepository;
use App\Models\ProductCategory;
use Prettus\Validator\Exceptions\ValidatorException;
use Laracasts\Flash\Flash;
use Exception;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;


class ProductCategoryController extends Controller
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

    public function __construct(ProductCategoryRepository $productCategoryRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->productCategoryRepository = $productCategoryRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }
        /**
     * Display a listing of the ProductCategory.
     *
     * @param ProductCategoryDataTable $productCategoryDataTable
     * @return mixed
     */
    public function index(ProductCategoryDataTable $productCategoryDataTable)
    {
        return $productCategoryDataTable->render('product_categories.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->productCategoryRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productCategoryRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('product_categories.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProductCategoryRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productCategoryRepository->model());
        try {
            $category = $this->productCategoryRepository->create($input);
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

        return redirect(route('productCategories.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $productCategory = $this->productCategoryRepository->findWithoutFail($id);
        if (empty($productCategory)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.product_category')]));
            return redirect(route('productCategories.index'));
        }
        $customFieldsValues = $productCategory->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productCategoryRepository->model());
        $hasCustomField = in_array($this->productCategoryRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }
        return view('product_categories.edit')->with('productCategory', $productCategory)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductCategoryRequest $request, $id)
    {
        $productCategory = $this->productCategoryRepository->findWithoutFail($id);

        if (empty($productCategory)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.product_category')]));
            return redirect(route('productCategories.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productCategoryRepository->model());
        try {
            $productCategory = $this->productCategoryRepository->update($input, $id);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($productCategory, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $productCategory->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.product_category')]));

        return redirect(route('productCategories.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $productCategory = $this->productCategoryRepository->findWithoutFail($id);
        if (empty($productCategory)) {
            Flash::error('Product Category not found');
            return redirect(route('productCategories.index'));
        }

        $check = DB::table('products')
            ->select(DB::raw('count(*) as in_use'))
            ->where('category_id', $productCategory->id)
            ->first();
        if($check->in_use){
            Flash::error('Category Not Deleted Because This Category Is Linked With Products!');
            return redirect(route('productCategories.index'));
        }

        $this->productCategoryRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.product')]));
        return redirect(route('productCategories.index'));
    }

    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $category = $this->productCategoryRepository->findWithoutFail($input['id']);
        try {
            if ($category->hasMedia($input['collection'])) {
                $category->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
