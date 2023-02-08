<div class='btn-group btn-group-sm'>
{{--    @can('banner-package.show')--}}
{{--        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.view_details')}}" href="{{ route('banner-package.show', $id) }}" class='btn btn-link'>--}}
{{--            <i class="fas fa-eye"></i> </a>--}}
{{--    @endcan--}}
    @can('banner-package.edit')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.banner_edit')}}" href="{{ route('banner-package.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a>
    @endcan

    @can('banner-package.destroy') {!! Form::open(['route' => ['banner-package.destroy', $id], 'method' => 'delete']) !!} {!! Form::button('<i class="fas fa-trash"></i>', [ 'type' => 'submit', 'class' => 'btn btn-link text-danger', 'onclick' => "return confirm('Are you sure?')" ]) !!} {!! Form::close() !!} @endcan
</div>
