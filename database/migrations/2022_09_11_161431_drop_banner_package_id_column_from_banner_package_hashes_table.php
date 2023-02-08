<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropBannerPackageIdColumnFromBannerPackageHashesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('banner_package_hashes', function (Blueprint $table) {
            $table->enum('status', ['draft','publish'])->after('description')->default('draft');
            $table->dropColumn('banner_package_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('banner_package_hashes', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
}
