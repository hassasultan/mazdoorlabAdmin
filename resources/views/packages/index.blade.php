@extends('layouts.app')

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
                        <li class="breadcrumb-item active">{{trans('lang.coupon_table')}}</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <div class="content">
        <div class="clearfix"></div>
        @include('flash::message')
        <div class="card shadow-sm">
            <div class="card-header">
                <ul class="nav nav-tabs d-flex flex-md-row flex-column-reverse align-items-start card-header-tabs">
                    <div class="d-flex flex-row">
                        <li class="nav-item">
                            <a class="nav-link active" href="{!! route('packages.index') !!}"><i class="fas fa-list mr-2"></i>packages</a>
                        </li>
                        
                            <li class="nav-item">
                                <a class="nav-link" href="{!! route('packages.create') !!}"><i class="fas fa-plus mr-2"></i>Package Create</a>
                            </li>
                      
                    </div>
                   
                </ul>
            </div>
          <div class="card-body">
              <table class="table" id="dataTableBuilder" width="100%">
	<thead>
		<tr>
			<th title="Code">Title</th>
			<th title="Discount">Price</th>
			<th>Discount Type</th>
			<th>Discount Amount</th>
			<th title="Description">Coins</th>
			<th title="Expires At">Status</th>
		
			<th title="Actions" width="80px">Actions</th>
		</tr>
	</thead>
	<tbody>
	    @foreach($package as $data)
	    <tr>
	        <td>{{$data->title}}</td>
	        <td>{{$data->price}}</td>
	        <td>{{$data->discount_type}}</td>
	        <td>{{$data->discount}}</td>
	        <td>{{$data->coins}}</td>
	        <td>{{$data->status}}</td>
	        <td>
	            
	            <a href="{{ url('packages/delete/'.$data->id) }}" class="btn btn-danger  " role="button" aria-disabled="true">Delete</a>
	            
	            <a href="{{ url('packages/edit/'.$data->id) }}" class="btn btn-success  " role="button" aria-disabled="true">Edit</a>
	            
	            <!--<a href"" type="button" class="btn btn-danger">Delete</a>-->

	        </td>
	    </tr>
	    @endforeach
	</tbody>
</table>
            </div>
        </div>
    </div>
@endsection

