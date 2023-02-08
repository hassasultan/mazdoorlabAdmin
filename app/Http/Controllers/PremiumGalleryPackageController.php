<?php

namespace App\Http\Controllers;

use App\DataTables\PremiumGalleryPackageDataTable;
use App\Http\Requests\UpdatePremiumGalleryPackageRequest;
use App\Http\Requests\CreatePremiumGalleryPackageRequest;
use App\PremiumGalleryPackage;
use App\Repositories\CustomFieldRepository;
use App\Repositories\PremiumGalleryPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Laracasts\Flash\Flash;
use Prettus\Validator\Exceptions\ValidatorException;

class PremiumGalleryPackageController extends Controller
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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(PremiumGalleryPackageDataTable $premiumGalleryPackageDataTable)
    {
        return $premiumGalleryPackageDataTable->render('premium_gallery_packages.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->premiumGalleryPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumGalleryPackageRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('premium_gallery_packages.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePremiumGalleryPackageRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumGalleryPackageRepository->model());
        try {
            $premium_package = $this->premiumGalleryPackageRepository->create($input);
            $premium_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                foreach ($input['image'] as $fileUuid) {
                    $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($premium_package, 'image');
                }
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.gallery')]));

        return redirect(route('premium-gallery-package.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PremiumGalleryPackage  $premiumGalleryPackage
     * @return \Illuminate\Http\Response
     */
    public function show(PremiumGalleryPackage $premiumGalleryPackage)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PremiumGalleryPackage  $premiumGalleryPackage
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $premium_package = $this->premiumGalleryPackageRepository->findWithoutFail($id);
        if (empty($premium_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.package')]));
            return redirect(route('premium-gallery-package.index'));
        }
        $customFieldsValues = $premium_package->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumGalleryPackageRepository->model());
        $hasCustomField = in_array($this->premiumGalleryPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }
        return view('premium_gallery_packages.edit')->with('premium_package', $premium_package)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PremiumGalleryPackage  $premiumBannerPackage
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePremiumGalleryPackageRequest $request, $id)
    {
        $premium_package = $this->premiumGalleryPackageRepository->findWithoutFail($id);

        if (empty($premium_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.gallery')]));
            return redirect(route('premium-gallery-package.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumGalleryPackageRepository->model());
        try {
            $premium_package = $this->premiumGalleryPackageRepository->update($input, $id);
            if (isset($input['image']) && $input['image'] && is_array($input['image'])) {
                foreach ($input['image'] as $fileUuid) {
                    $cacheUpload = $this->uploadRepository->getByUuid($fileUuid);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($premium_package, 'image');
                }
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $premium_package->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.gallery')]));

        return redirect(route('premium-gallery-package.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PremiumGalleryPackage  $premiumGalleryPackage
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $premium_package = $this->premiumGalleryPackageRepository->findWithoutFail($id);
        if (empty($premium_package)) {
            Flash::error('Premium Gallery Package not found');
            return redirect(route('premium-gallery-package.index'));
        }

        $this->premiumGalleryPackageRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.gallery')]));
        return redirect(route('premium-gallery-package.index'));
    }

    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $premium_package = $this->premiumGalleryPackageRepository->findWithoutFail($input['id']);
        try {
            if ($premium_package->hasMedia($input['collection'])) {
                $premium_package->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
