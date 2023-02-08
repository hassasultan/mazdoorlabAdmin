@if($customFields)
    <h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Name Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        {!! Form::label('name', trans("lang.category_name"), ['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.category_name_placeholder")]) !!}
            <div class="form-text text-muted">
                {{ trans("lang.category_name_help") }}
            </div>
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        {!! Form::label('description', trans("lang.category_description"), ['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
             trans("lang.category_description_placeholder")  ]) !!}
            <div class="form-text text-muted">{{ trans("lang.category_description_help") }}</div>
        </div>
    </div>
</div>
<div class="d-flex flex-column col-sm-12 col-md-6">
    <!-- Image Field -->
    <div class="form-group align-items-start d-flex flex-column flex-md-row">
        {!! Form::label('image', trans("lang.category_image"), ['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            <div style="width: 100%" class="dropzone image" id="image" data-field="image">
                <input type="hidden" name="image">
            </div>
            <a href="#loadMediaModal" data-dropzone="image" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
            <div class="form-text text-muted w-50">
                {{ trans("lang.category_image_help") }}
            </div>
        </div>
    </div>
    @prepend('scripts')
        <script type="text/javascript">
            var var16110650672130312723ble = '';
            @if(isset($premium_package) && $premium_package->hasMedia('image'))
                var16110650672130312723ble = {
                name: "{!! $premium_package->getFirstMedia('image')->name !!}",
                size: "{!! $premium_package->getFirstMedia('image')->size !!}",
                type: "{!! $premium_package->getFirstMedia('image')->mime_type !!}",
                collection_name: "{!! $premium_package->getFirstMedia('image')->collection_name !!}"
            };
            @endif
            var dz_var16110650672130312723ble = $(".dropzone.image").dropzone({
                url: "{!!url('uploads/store')!!}",
                addRemoveLinks: true,
                maxFiles: 1,
                init: function () {
                    @if(isset($premium_package) && $premium_package->hasMedia('image'))
                    dzInit(this, var16110650672130312723ble, '{!! url($premium_package->getFirstMediaUrl('image','thumb')) !!}')
                    @endif
                },
                accept: function (file, done) {
                    dzAccept(file, done, this.element, "{!!config('medialibrary.icons_folder')!!}");
                },
                sending: function (file, xhr, formData) {
                    dzSending(this, file, formData, '{!! csrf_token() !!}');
                },
                maxfilesexceeded: function (file) {
                    dz_var16110650672130312723ble[0].mockFile = '';
                    dzMaxfile(this, file);
                },
                complete: function (file) {
                    dzComplete(this, file, var16110650672130312723ble, dz_var16110650672130312723ble[0].mockFile);
                    dz_var16110650672130312723ble[0].mockFile = file;
                },
                removedfile: function (file) {
                    dzRemoveFile(
                        file, var16110650672130312723ble, '{!! url("premium-banner-package/remove-media") !!}',
                        'image', '{!! isset($premium_package) ? $premium_package->id : 0 !!}', '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
                    );
                }
            });
            dz_var16110650672130312723ble[0].mockFile = var16110650672130312723ble;
            dropzoneFields['image'] = dz_var16110650672130312723ble;
        </script>
    @endprepend
    <!-- Amount Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row ">
        {!! Form::label('coins', trans("lang.coin"), ['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            <div class="input-group">
                {!! Form::number('coins', null, ['class' => 'form-control','step'=>'any', 'min'=>'1', 'placeholder'=> trans("lang.insert_coin")]) !!}
            </div>
            <div class="form-text text-muted">
                {{ trans("lang.insert_coin") }}
            </div>
        </div>
    </div>
    <!-- Banner Expires Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        {!! Form::label('expire', trans("lang.expire"),['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            {!! Form::select('expire',
            ['1 month'=>'1 month','2 month'=>'2 month','3 month'=>'3 month','4 month'=>'4 month','5 month'=>'5 month','6 month'=>'6 month',
            '7 month'=>'7 month','8 month'=>'8 month','9 month'=>'9 month','10 month'=>'10 month','11 month'=>'11 month','12 month'=>'12 month'],
             isset($premium_package)?$premium_package->expire:null, ['data-empty'=>trans("lang.expire"), 'class' => 'select2 required form-control']) !!}
        </div>
    </div>
    <!-- Status Field -->
    <div class="form-group align-items-baseline d-flex flex-column flex-md-row">
        {!! Form::label('status', trans("lang.status"),['class' => 'col-md-3 control-label text-md-right mx-1']) !!}
        <div class="col-md-9">
            {!! Form::select('status', ['draft'=>'Draft','publish'=>'Publish'], isset($premium_package)?$premium_package->status:null, ['data-empty'=>trans("lang.product_category_status"), 'class' => 'select2 required form-control']) !!}
        </div>
    </div>
</div>
@if($customFields)
    <div class="clearfix"></div>
    <div class="col-12 custom-field-container">
        <h5 class="col-12 pb-4">{!! trans('lang.custom_field_plural') !!}</h5>
        {!! $customFields !!}
    </div>
@endif
<!-- Submit Field -->
<div class="form-group col-12 d-flex flex-column flex-md-row justify-content-md-end justify-content-sm-center border-top pt-4">
    <button type="submit" class="btn bg-{{setting('theme_color')}} mx-md-3 my-lg-0 my-xl-0 my-md-0 my-2">
        <i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.package')}}
    </button>
    <a href="{!! route('premium-banner-package.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
