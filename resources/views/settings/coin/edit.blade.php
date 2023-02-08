@extends('layouts.settings.default')
@push('css_lib')
    //
@endpush
@section('settings_title',trans('lang.coin_singular'))
@section('settings_content')
    @include('flash::message')
    @include('adminlte-templates::common.errors')
    <div class="clearfix"></div>
    <div class="card shadow-sm">
        <div class="card-header">
            <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="{!! url()->current() !!}"><i class="fas fa-money-bill mr-2"></i>{{trans('lang.app_setting_'.$type)}}</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            {!! Form::open(['url' => ['settings/update'], 'method' => 'patch']) !!}
            <div class="row">
                <h5 class="col-12 pb-4"><i class="mr-3 fas fa-money"></i>{{trans('lang.coin_desc')}}</h5>
                <!-- default_coin_amount Field -->
                <div class="form-group row col-6">
                    {!! Form::label('default_coin_amount', trans('lang.amount_singular'), ['class' => 'col-4 control-label text-right']) !!}
                    <div class="col-8">
                        {!! Form::text('default_coin_amount', setting('default_coin_amount'),  ['class' => 'form-control','placeholder'=>  'Enter Amount']) !!}
                        <div class="form-text text-muted">
                            {!! trans('lang.amount_help') !!}
                        </div>
                    </div>
                </div>

                <!-- Submit Field -->
                <div class="form-group mt-4 col-12 text-right">
                    <button type="submit" class="btn bg-{{setting('theme_color')}} mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
                        <i class="fas fa-save"></i> {{trans('lang.save')}}
                    </button>
                    <a href="{!! route('users.index') !!}" class="btn btn-default"><i class="fas fa-undo"></i> {{trans('lang.cancel')}}</a>
                </div>
            </div>
            {!! Form::close() !!}
            <div class="clearfix"></div>
        </div>
    </div>
    </div>
@endsection
@push('scripts_lib')
    //
@endpush
