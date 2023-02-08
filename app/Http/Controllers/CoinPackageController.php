<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCoinPackageRequest;
use App\Http\Requests\UpdateCoinPackageRequest;
use App\Models\CoinPackage;
use App\DataTables\CoinPackageDataTable;
use App\Repositories\CustomFieldRepository;
use App\Repositories\CoinPackageRepository;
use App\Repositories\UploadRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Laracasts\Flash\Flash;
use Prettus\Validator\Exceptions\ValidatorException;

class CoinPackageController extends Controller
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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(CoinPackageDataTable $coinPackageDataTable)
    {
        return $coinPackageDataTable->render('coin_packages.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hasCustomField = in_array($this->coinPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->coinPackageRepository->model());
            $html = generateCustomField($customFields);
        }
        return view('coin_packages.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateCoinPackageRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->coinPackageRepository->model());
        try {
            $category = $this->coinPackageRepository->create($input);
            $category->customFieldsValues()->createMany(getCustomFieldsValues($customFields, $request));
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully', ['operator' => __('lang.coin')]));

        return redirect(route('coin-package.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CoinPackage  $coinPackage
     * @return \Illuminate\Http\Response
     */
    public function show(CoinPackage $coinPackage)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CoinPackage  $coinPackage
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $coin_package = $this->coinPackageRepository->findWithoutFail($id);
        if (empty($coin_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.coin')]));
            return redirect(route('coin-package.index'));
        }
        $customFieldsValues = $coin_package->customFieldsValues()->with('customField')->get();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->coinPackageRepository->model());
        $hasCustomField = in_array($this->coinPackageRepository->model(), setting('custom_field_models', []));
        if ($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }
        return view('coin_packages.edit')->with('coin_package', $coin_package)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CoinPackage  $coinPackage
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCoinPackageRequest $request, $id)
    {
        $coin_package = $this->coinPackageRepository->findWithoutFail($id);

        if (empty($coin_package)) {
            Flash::error(__('lang.not_found', ['operator' => __('lang.coin')]));
            return redirect(route('coin-package.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->coinPackageRepository->model());
        try {
            $coin_package = $this->coinPackageRepository->update($input, $id);
            foreach (getCustomFieldsValues($customFields, $request) as $value) {
                $coin_package->customFieldsValues()
                    ->updateOrCreate(['custom_field_id' => $value['custom_field_id']], $value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully', ['operator' => __('lang.coin')]));

        return redirect(route('coin-package.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CoinPackage  $coinPackage
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $coin_package = $this->coinPackageRepository->findWithoutFail($id);
        if (empty($coin_package)) {
            Flash::error('Coin not found');
            return redirect(route('coin-package.index'));
        }

        $this->coinPackageRepository->delete($id);
        Flash::success(__('lang.deleted_successfully', ['operator' => __('lang.coin')]));
        return redirect(route('coin-package.index'));
    }
}
