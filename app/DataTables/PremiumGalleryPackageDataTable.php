<?php
/*
 * File name: FaqCategoryDataTable.php
 * Last modified: 2021.11.24 at 19:18:10
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

namespace App\DataTables;

use App\Models\CustomField;
use App\Models\PremiumGalleryPackage;
use App\Models\Post;
use Barryvdh\DomPDF\Facade as PDF;
use Yajra\DataTables\DataTableAbstract;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder;
use Yajra\DataTables\Services\DataTable;
use Illuminate\Support\Facades\DB;

class PremiumGalleryPackageDataTable extends DataTable
{
    /**
     * custom fields columns
     * @var array
     */
    public static $customFields = [];

    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return DataTableAbstract
     */
    public function dataTable($query)
    {
        $dataTable = new EloquentDataTable($query);
        $columns = array_column($this->getColumns(), 'data');
        $dataTable = $dataTable
            ->editColumn('image', function ($premium_package) {
                return getMediaColumn($premium_package, 'image');
            })
            ->editColumn('name', function ($premium_package) {
                return $premium_package->name;
            })
            ->editColumn('description', function ($premium_package) {
                return getStripedHtmlColumn($premium_package, 'description');
            })
            ->editColumn('amount', function ($premium_package) {
                return $premium_package->coins;
            })
            ->editColumn('expire', function ($premium_package) {
                return $premium_package->expire;
            })
            ->editColumn('status', function ($premium_package) {
                return $premium_package->status;
            })
            ->editColumn('updated_at', function ($premium_package) {
                return getDateColumn($premium_package, 'updated_at');
            })
            ->addColumn('action', 'premium_gallery_packages.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        $columns = [
            [
                'data' => 'image',
                'title' => trans('lang.category_image'),
                'searchable' => false, 'orderable' => false, 'exportable' => false, 'printable' => false,
            ],
            [
                'data' => 'name',
                'title' => trans('lang.category_name'),

            ],
            [
                'data' => 'description',
                'title' => trans('lang.category_description'),

            ],
            [
                'data' => 'coins',
                'title' => trans('lang.coin'),

            ],
            [
                'data' => 'expire',
                'title' => trans('lang.expire'),

            ],
            [
                'data' => 'status',
                'title' => 'Status',
            ],
            [
                'data' => 'updated_at',
                'title' => trans('lang.category_updated_at'),
                'searchable' => false,
            ]
        ];

        $hasCustomField = in_array(PremiumGalleryPackage::class, setting('custom_field_models', []));
        if ($hasCustomField) {
            $customFieldsCollection = DB::table('custom_fields')->where('custom_field_model', PremiumGalleryPackage::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.faq_category_' . $field->name),
                    'orderable' => false,
                    'searchable' => false,
                ]]);
            }
        }
        return $columns;
    }

    /**
     * Get query source of dataTable.
     *
     * @param Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(PremiumGalleryPackage $model)
    {
        return $model->newQuery()->select("$model->table.*");
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->addAction(['title' => trans('lang.actions'), 'width' => '80px', 'printable' => false, 'responsivePriority' => '100'])
            ->parameters(array_merge(
                config('datatables-buttons.parameters'), [
                    'language' => json_decode(
                        file_get_contents(base_path('resources/lang/' . app()->getLocale() . '/datatable.json')
                        ), true)
                ]
            ));
    }

    /**
     * Export PDF using DOMPDF
     * @return mixed
     */
    public function pdf()
    {
        $data = $this->getDataForPrint();
        $pdf = PDF::loadView($this->printPreview, compact('data'));
        return $pdf->download($this->filename() . '.pdf');
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'premium_gallery_packages_datatable_' . time();
    }
}
