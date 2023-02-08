<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddExpireToPremiumGalleryPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('premium_gallery_packages', function (Blueprint $table) {
            $table->string('expire',100)->after('coins')->default('null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('premium_gallery_packages', function (Blueprint $table) {
            $table->dropColumn('expire');
        });
    }
}
