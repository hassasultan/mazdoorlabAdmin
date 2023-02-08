<?php

namespace App\Http\Controllers;

use App\Criteria\BannerPackageHash\BannerPackageHashOfUserCriteria;
use App\Models\BannerPackageHash;
use Illuminate\Http\Request;
use App\DataTables\BannerPackageHashDataTable;
use App\Http\Requests\CreateBannerPackageHashRequest;
use App\Http\Requests\UpdateBannerPackageHashRequest;
use App\Repositories\CustomFieldRepository;
use App\Repositories\BannerPackageHashRepository;
use App\Repositories\UploadRepository;
use App\Models\BannerPackage;
use Prettus\Validator\Exceptions\ValidatorException;
use Laracasts\Flash\Flash;
use Exception;
use Illuminate\Support\Facades\Log;


class BannerPackageHashController extends Controller
{
    /**
     * @var BannerPackageHashRepository
     */
    private $bannerPackageHashRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var UploadRepository
     */
    private $uploadRepository;

    public function __construct(BannerPackageHashRepository $bannerPackageHashRepo, CustomFieldRepository $customFieldRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->bannerPackageHashRepository = $bannerPackageHashRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;

    }
    /**
     * Display a listing of the ProductCategory.
     *
     * @param BannerPackageHashDataTable $bannerPackageHashDataTable
     * @return mixed
     */
    public function index(BannerPackageHashDataTable $bannerPackageHashDataTable)
    {
        return $bannerPackageHashDataTable->render('banner_package_hashes.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->bannerPackageHashRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageHashRepository->model());
            $html = generateCustomField($customFields);
        }

        $banner_package = BannerPackage::all();
        $banner_name = [];
        foreach($banner_package as $package){
            $banner_name[$package->id] = $package->name;
        }

        return view('banner_package_hashes.create',compact('banner_name'))->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateBannerPackageHashRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageHashRepository->model());
        try {
            $hash = $this->bannerPackageHashRepository->create($input);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($hash, 'image');
            }
            $hash->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.dashboard_hashtag')]));

        return redirect(route('hashtag.index'));
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

        $hash = $this->bannerPackageHashRepository->findWithoutFail($id);
        if (empty($hash)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.dashboard_hashtag')]));
            return redirect(route('hashtag.index'));
        }
        $customFieldsValues = $hash->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageHashRepository->model());
        $hasCustomField = in_array($this->bannerPackageHashRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('banner_package_hashes.edit')->with('hash', $hash)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBannerPackageHashRequest $request, $id)
    {
        $banner_package = $this->bannerPackageHashRepository->findWithoutFail($id);

        if (empty($banner_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.dashboard_hashtag')]));
            return redirect(route('hashtag.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->bannerPackageHashRepository->model());
        try {
            $hash = $this->bannerPackageHashRepository->update($input, $id);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($hash, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $hash->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }
        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.dashboard_hashtag')]));
        return redirect(route('hashtag.index'));
    }

    public function destroy($id)
    {
        $this->bannerPackageHashRepository->pushCriteria(new BannerPackageHashOfUserCriteria(auth()->id()));
        $banner_package = $this->bannerPackageHashRepository->findWithoutFail($id);

        if (empty($banner_package)) {
            Flash::error('Hash not found');
            return redirect(route('hashtag.index'));
        }

        $this->bannerPackageHashRepository->delete($id);

        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.dashboard_hashtag')]));

        return redirect(route('hashtag.index'));

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
        $category = $this->bannerPackageHashRepository->findWithoutFail($input['id']);
        try {
            if ($category->hasMedia($input['collection'])) {
                $category->getFirstMedia($input['collection'])->delete();
            }
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
