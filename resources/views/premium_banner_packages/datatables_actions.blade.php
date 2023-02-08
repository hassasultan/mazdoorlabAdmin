<div class='btn-group btn-group-sm'>
    {{-- @can('productCategories.show')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.view_details')}}" href="{{ route('productCategories.show', $id) }}" class='btn btn-link'>
            <i class="fas fa-eye"></i> </a>
    @endcan --}}
    @can('premium-banner-package.edit')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.edit')}} {{trans('lang.package')}}" href="{{ route('premium-banner-package.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a>
    @endcan

    @can('premium-banner-package.destroy')
        {!! Form::open(['route' => ['premium-banner-package.destroy', $id], 'method' => 'delete']) !!}
        {!! Form::button('<i class="fas fa-trash"></i>', [
        'type' => 'submit',
        'class' => 'btn btn-link text-danger',
        'onclick' => "return confirm('Are you sure?')"
        ]) !!}
        {!! Form::close() !!}
  @endcan
</div>
