<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAmountColumnInBannerPurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('banner_purchases', function (Blueprint $table) {
            $table->decimal('amount',18,4)->nullable()->after('coins');
            $table->string('description')->nullable()->after('amount');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('banner_purchases', function (Blueprint $table) {
            $table->dropColumn('amount');
            $table->dropColumn('description');
        });
    }
}
