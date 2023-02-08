<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePremiumGalleryPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('premium_gallery_packages', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->longText('description')->nullable()->default('null');
            $table->integer('coins')->default(0);
            $table->enum('status', ['draft','publish'])->default('draft');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('premium_gallery_packages');
    }
}
