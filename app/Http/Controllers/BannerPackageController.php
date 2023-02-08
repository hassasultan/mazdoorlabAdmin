<?php

namespace App\Http\Controllers;

use App\Criteria\BannerPackage\BannerPackageOfUserCriteria;
use App\Models\BannerPackage;
use Illuminate\Http\Request;
use App\DataTables\BannerPackageDataTable;
use App\Http\Requests\CreateBannerPackageRequest;
use App\Http\Requests\UpdateBannerPackageRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\BannerPackageRepository;
use App\Repositories\UploadRepository;
use Prettus\Validator\Exceptions\ValidatorException;
use Laracasts\Flash\Flash;
use Exception;
use Illuminate\Support\Facades\Log;


class BannerPackageController extends Controller
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
    /**
     * Display a listing of the ProductCategory.
     *
     * @param BannerPackageDataTable $bannerPackageDataTable
     * @return mixed
     */
    public function index(BannerPackageDataTable $bannerPackageDataTable)
    {
        return $bannerPackageDataTable->render('banner_packages.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->bannerPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('banner_packages.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateBannerPackageRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageRepository->model());
        try {
            $banner_package = $this->bannerPackageRepository->create($input);
            $banner_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                foreach ($input['image'] as $fileUuid) {
                    $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($banner_package, 'image');
                }
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.discover_bannername')]));

        return redirect(route('banner-package.index'));
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
        $banner_package = $this->bannerPackageRepository->findWithoutFail($id);
        if (empty($banner_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.discover_bannername')]));
            return redirect(route('hashtag.index'));
        }
        $customFieldsValues = $banner_package->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageRepository->model());
        $hasCustomField = in_array($this->bannerPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }
        return view('banner_packages.edit')->with('banner_package', $banner_package)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBannerPackageRequest $request, $id)
    {
        $product = $this->bannerPackageRepository->findWithoutFail($id);

        if (empty($product)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.discover_bannername')]));
            return redirect(route('hashtag.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageRepository->model());
        try {
            $product = $this->bannerPackageRepository->update($input, $id);
            if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                foreach ($input['image'] as $fileUuid) {
                    $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($product, 'image');
                }
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $product->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.discover_bannername')]));

        return redirect(route('banner-package.index'));
    }

    public function destroy($id)
    {
        $banner_package = $this->bannerPackageRepository->findWithoutFail($id);
        if (empty($banner_package)) {
            Flash::error('Banner not found');
            return redirect(route('banner-package.index'));
        }

        $this->bannerPackageRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.discover_bannername')]));
        return redirect(route('banner-package.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $category = $this->bannerPackageRepository->findWithoutFail($input['id']);
        try {
            if ($category->hasMedia($input['collection'])) {
                $category->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
