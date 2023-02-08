<div class='btn-group btn-group-sm'>
    @can('hashtag.edit')
        <a data-toggle="tooltip" data-placement="left" title="{{trans('lang.hash_edit')}}" href="{{ route('hashtag.edit', $id) }}" class='btn btn-link'>
            <i class="fas fa-edit"></i> </a>
    @endcan

    @can('hashtag.destroy')
        {!! Form::open(['route' => ['hashtag.destroy', $id], 'method' => 'delete']) !!}
        {!! Form::button('<i class="fas fa-trash"></i>', [
        'type' => 'submit',
        'class' => 'btn btn-link text-danger',
        'onclick' => "return confirm('Are you sure?')"
        ]) !!}
        {!! Form::close() !!}
  @endcan
</div>
