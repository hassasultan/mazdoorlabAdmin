@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-bold">Package Order<small class="mx-3">|</small><small>Package Order Management</small></h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb bg-white float-sm-right rounded-pill px-4 py-2 d-none d-md-flex">
                        <li class="breadcrumb-item"><a href="{{url('/dashboard')}}"><i class="fas fa-tachometer-alt"></i> {{trans('lang.dashboard')}}</a></li>
                        <li class="breadcrumb-item"><a href="{!! route('coupons.index') !!}">Package Order</a>
                        </li>
                        <li class="breadcrumb-item active">Package Order</li>
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
                            <a class="nav-link active" href="{!! route('packages.index') !!}"><i class="fas fa-list mr-2"></i>Package Orders</a>
                        </li>
                        
                            <!--<li class="nav-item">-->
                            <!--    <a class="nav-link" href="{!! route('packages.create') !!}"><i class="fas fa-plus mr-2"></i>Package Create</a>-->
                            <!--</li>-->
                      
                    </div>
                   
                </ul>
            </div>
          <div class="card-body">
              <table class="table" id="dataTableBuilder" width="100%">
	<thead>
		<tr>
			<th title="Code">Package Name</th>
			<th title="Discount">Price</th>
			<th>coin</th>
			<th>Payment Method</th>
			<th title="Description">User</th>
			<th title="Expires At">Status</th>
		
			<th title="Actions" width="80px">Actions</th>
		</tr>
	</thead>
	<tbody>
	    @foreach($package_order as $data)
	    <tr>
	        <td>{{$data->package_title}}</td>
	        <td>{{$data->price}}</td>
	        <td>{{$data->coins}}</td>
	        <td>{{$data->payment_method}}</td>
	        <td>{{$data->username}}</td>
	        <td class="status">
	            @if($data->status == 0)
	            
	            <span class="badge badge-danger">Pending</span>
	            
	            @else
	            <span class="badge badge-success">Sussess</span>
	            
	            @endif
	            
	        </td>
	        <td>
	            
	            <input type="checkbox" class="checkbox"  value="{{$data->id}}" data-userid="{{$data->user_id}}"  data-coin="{{$data->coins}}"  @if($data->status == 1) checked  @endif   />
	            
	            
	            <!--<a  href="{{ url('packages/delete/'.$data->id) }}"  class="btn btn-link text-danger" ><i class="fas fa-trash"></i></a>-->
	            
	           

	        </td>
	    </tr>
	    @endforeach
	</tbody>
</table>
            </div>
        </div>
    </div>
    
    
   
    
    
    
    
@endsection

