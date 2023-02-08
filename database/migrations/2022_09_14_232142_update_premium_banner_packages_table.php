<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdatePremiumBannerPackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('premium_banner_packages', function (Blueprint $table) {
            $table->renameColumn('amount', 'coins');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('premium_banner_packages', function (Blueprint $table) {
            $table->renameColumn('coins', 'amount');
        });
    }
}
