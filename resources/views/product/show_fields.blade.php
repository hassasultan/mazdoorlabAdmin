<div class="col-sm-12 col-md-6">
    <!-- Id Field -->
    <div class="form-group row col-12">
        {!! Form::label('product', 'Product:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! $product->name !!}</p>
        </div>
    </div>

    <!-- Title Field -->
    <div class="form-group row col-12">
        {!! Form::label('category', 'Category:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! $product->product_category->name !!}</p>
        </div>
    </div>

    <div class="form-group row col-12">
        {!! Form::label('status', 'Status:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! $product->status !!}</p>
        </div>
    </div>

    <!-- Updated At Field -->
    <div class="form-group row col-12">
        {!! Form::label('updated_at', 'Updated At:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! getDateColumn($product, 'updated_at') !!}</p>
        </div>
    </div>

    <!-- Description Field -->
    <div class="form-group row col-12">
        {!! Form::label('description', 'Description:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-4">
            <p>{!! $product->description !!}</p>
        </div>
    </div>

    <!--Stock Field -->
    <div class="form-group row col-12">
        {!! Form::label('stock', 'Stock:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-4">
            <p>{!! isset($stock->quantity)?$stock->quantity:0 !!}</p>
        </div>
    </div>

</div>
<div class="col-sm-12 col-md-6">
    <!-- Image Field -->
    <div class="form-group row col-12">
        {!! Form::label('image', 'Image:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! getMediaColumn($product, 'image') !!}</p>
        </div>
    </div>
    <!-- Price Field -->
    <div class="form-group row col-12">
        {!! Form::label('Price', 'Price:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! $product->price !!}</p>
        </div>
    </div>
    <!-- Discount Field -->
    <div class="form-group row col-12">
        {!! Form::label('discount', 'Discount Price:', ['class' => 'col-md-3 control-label text-md-left mx-1']) !!}
        <div class="col-md-8">
            <p>{!! $product->discount !!}</p>
        </div>
    </div>
</div>



