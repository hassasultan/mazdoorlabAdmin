@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold">{{trans('lang.product') }}<small class="mx-3">|</small><small>{{trans('lang.product_desc')}}</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="{{url('/')}}"><i class="fas fa-tachometer-alt"></i> {{trans('lang.dashboard')}}</a></li>
                        <li class="breadcrumb-itema ctive"><a href="{!! route('products.index') !!}">{{trans('lang.product')}}</a>
                        </li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    @include('flash::message')
    <div class="content">
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-row align-items-start card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="{!! route('products.index') !!}"><i class="fa fa-list mr-2"></i>{{trans('lang.product_table')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="{!! route('products.create') !!}"><i class="fa fa-plus mr-2"></i>{{trans('lang.product_create')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript::;" data-toggle="modal" data-target="#addstock"><i class="fa fa-plus mr-2"></i>{{trans('lang.ProductAdd_stock')}}</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <div class="row">
                @include('product.show_fields')

                <!-- Back Field -->
                    <div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
                        <a href="{!! route('products.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.back')}}</a>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

{{--    Add stock Modal--}}

    <div class="modal fade" id="addstock" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header border-bottom-0 pb-0">
                    <p class="modal-title text-danger pl-3" id="exampleModalLabel"><small>{{trans("lang.ProductAdd_stock")}}</small></p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <div class="modal-body mt-5">
                        <div class="form-group">
                            <div class="container">
                                {!! Form::open(['url' => 'products/add-stock', 'method' => 'post']) !!}
                                <div class="row">
                                    <div class="col-12" id="form_result">
                                        <div class="form-group d-flex">
                                            {!! Form::label('price', trans("lang.ProductAdd_stock"), ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
                                            <div class="col-md-9">
                                                <div class="input-group">
                                                    {!! Form::number('product_stock', null, ['class' => 'form-control','step'=>'any', 'min'=>'1', 'placeholder'=> trans("lang.enter_stock")]) !!}
                                                    <input type="hidden" name="product_id" value="{{$product->id}}"/>
                                                </div>
                                                <div class="form-text text-muted">
                                                    {{ trans("lang.Insert_stock") }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn" data-dismiss="modal" style="border:1px solid #5e5f61;">Cancel</button>
                                    <button type="submit" class="btn btn-primary edit_connection_file">Save</button>
                                </div>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
