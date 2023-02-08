@extends('layouts.app')
@push('css_lib')
    <link rel="stylesheet" href="{{asset('vendor/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/select2/css/select2.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/summernote/summernote-bs4.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/dropzone/min/dropzone.min.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">
@endpush
@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold">{{trans('lang.coupon_plural') }}<small class="mx-3">|</small><small>{{trans('lang.coupon_desc')}}</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="{{url('/dashboard')}}"><i class="fas fa-tachometer-alt"></i> {{trans('lang.dashboard')}}</a></li>
                        <li class="breadcrumb-item"><a href="{!! route('coupons.index') !!}">{{trans('lang.coupon_plural')}}</a>
                        </li>
                        <li class="breadcrumb-item active">{{trans('lang.coupon_create')}}</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="content">
        <div class="clearfix"></div>
        @include('flash::message')
        @include('adminlte-templates::common.errors')
        <div class="clearfix"></div>
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                   
                        <li class="nav-item">
                            <a class="nav-link" href="{!! route('packages.index') !!}"><i class="fas fa-list mr-2"></i>Packages</a>
                        </li>
                   
                    <li class="nav-item">
                        <a class="nav-link active" href="{!! route('packages.create') !!}"><i class="fas fa-plus mr-2"></i>Create Packages</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <form method="POST" action="https://mazdoorlab.com/admin/packages" accept-charset="UTF-8"><input name="_token" type="hidden" value="kELEKx6pBqZSzqTtwqT9u00GVHKweeU1WcZEfW4L">
                <div class="row">
                    <div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Code Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="code" class="col-md-3 control-label text-md-right mx-1">Title</label>
        <div class="col-md-9">
                            <input class="form-control" placeholder="Title" name="title" type="text" id="title">
              
                    </div>
    </div>
    
    
    
    
        <!-- Discount Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="discount" class="col-md-3 control-label text-md-right mx-1">Price</label>
        <div class="col-md-9">
            <input class="form-control" placeholder="" step="any" min="0" name="price" type="number" id="price">
           
        </div>
    </div>
    


  <!-- Discount Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="discount" class="col-md-3 control-label text-md-right mx-1">Coin</label>
        <div class="col-md-9">
            <input class="form-control" placeholder="" step="any" min="0" name="coin" type="number" id="coin">
           
        </div>
    </div>
    
    
    <!-- Discount Type Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="discount_type" class="col-md-3 control-label text-md-right mx-1">Discount Type</label>
        <div class="col-md-9">
            <select class="select2 form-control" id="discount_type" name="discount_type">
                <option value="percent">Percent</option>
                <option value="fixed">Fixed</option></select>
           
        </div>
    </div>

    <!-- Discount Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="discount" class="col-md-3 control-label text-md-right mx-1">Discount</label>
        <div class="col-md-9">
            <input class="form-control" placeholder="" step="any" min="0" name="discount" type="number" id="discount">
           
        </div>
    </div>
    
    
    

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        <label for="description" class="col-md-3 control-label text-md-right mx-1">Description</label>
        <div class="col-md-9">
            <textarea class="form-control" placeholder="Insert Description" name="description" cols="50" rows="10" id="description"></textarea>
            <div class="form-text text-muted">Insert Description</div>
        </div>
    </div>

</div>

<!-- Submit Field -->
<div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
    <button type="submit" class="btn bg-primary mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
        <i class="fas fa-save"></i> Save Coupon</button>
    <a href="https://mazdoorlab.com/admin/coupons" class="btn btn-default"><i class="fas fa-undo"></i> Cancel</a>
</div>
                </div>
                </form>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    @include('layouts.media_modal')
@endsection
@push('scripts_lib')
    <script src="{{asset('vendor/select2/js/select2.full.min.js')}}"></script>
    <script src="{{asset('vendor/summernote/summernote.min.js')}}"></script>
    <script src="{{asset('vendor/dropzone/min/dropzone.min.js')}}"></script>
    <script src="{{asset('vendor/moment/moment.min.js')}}"></script>
    <script src="{{asset('vendor/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')}}"></script>
    <script type="text/javascript">
        Dropzone.autoDiscover = false;
        var dropzoneFields = [];
    </script>
@endpush
