<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPaymentMethodIdToPremiumGalleryPurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('premium_gallery_purchases', function (Blueprint $table) {
            $table->integer('payment_method_id')->nullable()->after('user_id')->index();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('premium_gallery_purchases', function (Blueprint $table) {
            $table->dropColumn('payment_method_id');
        });
    }
}
