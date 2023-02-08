<?php

namespace App\Http\Controllers;

use App\DataTables\PremiumBannerPackageDataTable;
use App\Http\Requests\UpdatePremiumBannerPackageRequest;
use App\Http\Requests\CreatePremiumBannerPackageRequest;
use App\PremiumBannerPackage;
use App\Repositories\CustomFieldRepository;
use App\Repositories\PremiumBannerPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Laracasts\Flash\Flash;
use Prettus\Validator\Exceptions\ValidatorException;

class PremiumBannerPackageController extends Controller
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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(PremiumBannerPackageDataTable $premiumBannerPackageDataTable)
    {
        return $premiumBannerPackageDataTable->render('premium_banner_packages.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->premiumBannerPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumBannerPackageRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('premium_banner_packages.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePremiumBannerPackageRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumBannerPackageRepository->model());
        try {
            $premium_package = $this->premiumBannerPackageRepository->create($input);
            $premium_package->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($premium_package, 'image');
                $image = DB::table('uploads')
                    ->leftJoin('media','media.model_id','uploads.id')
                    ->where('uploads.uuid', $request->image)
                    ->first();
                if($image){
                    $image_url = '/storage/app/public/'.$image->id.'/'.$image->file_name;
                    DB::table('premium_banner_packages')
                            ->where('id',$premium_package->id)
                            ->update([
                                'image' => $image_url
                            ]);
                }
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.package')]));

        return redirect(route('premium-banner-package.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PremiumBannerPackage  $premiumBannerPackage
     * @return \Illuminate\Http\Response
     */
    public function show(PremiumBannerPackage $premiumBannerPackage)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PremiumBannerPackage  $premiumBannerPackage
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $premium_package = $this->premiumBannerPackageRepository->findWithoutFail($id);
        if (empty($premium_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.package')]));
            return redirect(route('premium-banner-package.index'));
        }
        $customFieldsValues = $premium_package->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumBannerPackageRepository->model());
        $hasCustomField = in_array($this->premiumBannerPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }
        return view('premium_banner_packages.edit')->with('premium_package', $premium_package)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PremiumBannerPackage  $premiumBannerPackage
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePremiumBannerPackageRequest $request, $id)
    {
        $premium_package = $this->premiumBannerPackageRepository->findWithoutFail($id);

        if (empty($premium_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.package')]));
            return redirect(route('premium-banner-package.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->premiumBannerPackageRepository->model());
        try {
            $premium_package = $this->premiumBannerPackageRepository->update($input, $id);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($premium_package, 'image');
                $image = DB::table('uploads')
                    ->leftJoin('media','media.model_id','uploads.id')
                    ->where('uploads.uuid', $request->image)
                    ->first();
                if($image){
                    $image_url = '/storage/app/public/'.$image->id.'/'.$image->file_name;
                    DB::table('premium_banner_packages')
                        ->where('id',$premium_package->id)
                        ->update([
                            'image' => $image_url
                        ]);
                }
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $premium_package->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.package')]));

        return redirect(route('premium-banner-package.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PremiumBannerPackage  $premiumBannerPackage
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $premium_package = $this->premiumBannerPackageRepository->findWithoutFail($id);
        if (empty($premium_package)) {
            Flash::error('Premium Banner Package not found');
            return redirect(route('premium-banner-package.index'));
        }

        $this->premiumBannerPackageRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.package')]));
        return redirect(route('premium-banner-package.index'));
    }

    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $premium_package = $this->premiumBannerPackageRepository->findWithoutFail($input['id']);
        try {
            if ($premium_package->hasMedia($input['collection'])) {
                $premium_package->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
