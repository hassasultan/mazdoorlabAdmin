<div class='btn-group btn-group-sm'>
    {{-- @can('productCategories.show')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.view_details')}}" href="{{ route('productCategories.show', $id) }}" class='btn btn-link'>
            <i class="fas fa-eye"></i> </a>
    @endcan --}}
    @can('premium-gallery-package.edit')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.edit')}} {{trans('lang.gallery')}}" href="{{ route('premium-gallery-package.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a>
    @endcan

    @can('premium-gallery-package.destroy')
        {!! Form::open(['route' => ['premium-gallery-package.destroy', $id], 'method' => 'delete']) !!}
        {!! Form::button('<i class="fas fa-trash"></i>', [
        'type' => 'submit',
        'class' => 'btn btn-link text-danger',
        'onclick' => "return confirm('Are you sure?')"
        ]) !!}
        {!! Form::close() !!}
  @endcan
</div>
