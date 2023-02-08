<?php
/*
 * File name: api.php
 * Last modified: 2021.12.10 at 14:10:52
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */
 use Illuminate\Http\Request;
use App\Http\Controllers\API\ShopAPIController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|s
*/


Route::middleware('auth:api')->get('/user', function(Request $request) {
    return $request->user();
});
Route::post('create-shop','API\ShopAPIController@create');
Route::get('edit-shop/{id}','API\ShopAPIController@edit');
Route::post('update-shop/{id}','API\ShopAPIController@update');
Route::get('delete/{id}','API\ShopAPIController@destroy');
Route::get('shop/{id}','API\ShopAPIController@getShop');

Route::post('checkout','API\CheckoutController@checkout');
Route::post('payments/stripe/pay-success', 'API\CheckoutController@paySuccess');

Route::post('create-profile','API\PublicShopApiController@create');
Route::get('visit-user/{id}', 'API\UserAPIController@visit');
Route::get('visit-profile/{id}', 'API\PublicShopApiController@index');
Route::get('edit-profile/{id}', 'API\PublicShopApiController@edit');
Route::post('update-profile/{id}', 'API\PublicShopApiController@update');

//product purchase
Route::post('product-purchase','API\ProductPurchaseAPIController@create');
Route::get('product-purchase_list/{user_id?}','API\ProductPurchaseAPIController@index');

//banner purchase
Route::post('banner-purchase','API\BannerPurchaseAPIController@create');
Route::get('banner-purchase_list/{user_id?}','API\BannerPurchaseAPIController@index');

//gallery purchase
Route::post('premium-gallery-purchase','API\PremiumGalleryPurchaseAPIController@create');
Route::get('premium-gallery-purchase_list/{user_id?}','API\PremiumGalleryPurchaseAPIController@index');

//coin purchase
Route::post('coin-purchase','API\CoinPurchaseAPIController@create');
Route::get('coin-purchase_list/{user_id?}','API\CoinPurchaseAPIController@index');

//product package
Route::get('product/show/{id}','API\ProductAPIController@show');
Route::get('product_list','API\ProductAPIController@index');
Route::post('product-create','API\ProductAPIController@create');

//product Category package
Route::get('productCategory/show/{id}','API\ProductCategoryAPIController@show');
Route::get('productCategory_list','API\ProductCategoryAPIController@index');
Route::get('get_categoryProducts/{id}','API\ProductCategoryAPIController@get_categoryProducts');
Route::post('product-category-create','API\ProductCategoryAPIController@create');

//premium banner package
Route::get('premium-banner-package/show/{id}','API\PremiumBannerPackageAPIController@show');
Route::get('premium-banner-package_list','API\PremiumBannerPackageAPIController@index');
Route::post('premium-banner-package-create','API\PremiumBannerPackageAPIController@create');

//premium gallery package
Route::get('premium-gallery-package/show/{id}','API\PremiumGalleryPackageAPIController@show');
Route::get('premium-gallery-package_list','API\PremiumGalleryPackageAPIController@index');
Route::post('premium-gallery-package-create','API\PremiumGalleryPackageAPIController@create');


//premium coin package
Route::get('coin-package/show/{id}','API\CoinPackageAPIController@show');
Route::get('coin-package_list','API\CoinPackageAPIController@index');
Route::post('coin-package-create','API\CoinPackageAPIController@create');


//discover banner
Route::post('banner-package','API\BannerPackageAPIController@create');
Route::get('banner-package_list','API\BannerPackageAPIController@index');
Route::get('banner-package/show/{id}','API\BannerPackageAPIController@show');

//discover banner hash
Route::get('hash/show/{media_id}','API\HashtagAPIController@show');
Route::get('hash_list','API\HashtagAPIController@index');
Route::post('hash-create','API\HashtagAPIController@create');

Route::get('qrcode/{id}', 'API\ShopAPIController@getShop');

Route::prefix('provider')->group(function () {
    Route::post('login', 'API\EProvider\UserAPIController@login');
    Route::post('register', 'API\EProvider\UserAPIController@register');
    Route::post('send_reset_link_email', 'API\UserAPIController@sendResetLinkEmail');
    Route::get('user', 'API\EProvider\UserAPIController@user');
    Route::get('logout', 'API\EProvider\UserAPIController@logout');
    Route::get('settings', 'API\EProvider\UserAPIController@settings');
});


Route::post('login', 'API\UserAPIController@login');
Route::post('register', 'API\UserAPIController@register');
Route::post('send_reset_link_email', 'API\UserAPIController@sendResetLinkEmail');
Route::get('user', 'API\UserAPIController@user');
Route::get('logout', 'API\UserAPIController@logout');
Route::get('settings', 'API\UserAPIController@settings');
Route::get('edit-user-profile/{id}', 'API\UserAPIController@edit');
Route::post('del-user', 'API\UserAPIController@delUser');
Route::get('get-all-users', 'API\UserAPIController@getAllUsers');


Route::resource('e_provider_types', 'API\EProviderTypeAPIController');
Route::resource('e_providers', 'API\EProviderAPIController');
Route::resource('availability_hours', 'API\AvailabilityHourAPIController');
Route::resource('awards', 'API\AwardAPIController');
Route::resource('experiences', 'API\ExperienceAPIController');
Route::get('shop','API\ShopAPIController@index');





Route::resource('faq_categories', 'API\FaqCategoryAPIController');
Route::resource('faqs', 'API\FaqAPIController');
Route::resource('custom_pages', 'API\CustomPageAPIController');

Route::resource('categories', 'API\CategoryAPIController');

Route::resource('e_services', 'API\EServiceAPIController');
Route::resource('galleries', 'API\GalleryAPIController');
Route::get('e_service_reviews/{id}', 'API\EServiceReviewAPIController@show')->name('e_service_reviews.show');
Route::get('e_service_reviews', 'API\EServiceReviewAPIController@index')->name('e_service_reviews.index');

Route::resource('currencies', 'API\CurrencyAPIController');
Route::resource('slides', 'API\SlideAPIController');
Route::resource('booking_statuses', 'API\BookingStatusAPIController');
Route::resource('option_groups', 'API\OptionGroupAPIController');
Route::resource('options', 'API\OptionAPIController');

Route::middleware('auth:api')->group(function () {
    Route::group(['middleware' => ['role:provider']], function () {
        Route::prefix('provider')->group(function () {
            Route::post('users/{user}', 'API\UserAPIController@update');
            Route::get('dashboard', 'API\DashboardAPIController@provider');
            Route::resource('e_providers', 'API\EProvider\EProviderAPIController');
            Route::resource('notifications', 'API\NotificationAPIController');
            Route::get('e_service_reviews', 'API\EServiceReviewAPIController@index')->name('e_service_reviews.index');
            Route::get('e_services', 'API\EServiceAPIController@index')->name('e_services.index');
            Route::put('payments/{id}', 'API\PaymentAPIController@update')->name('payments.update');
        });
    });
    Route::post('uploads/store', 'API\UploadAPIController@store');
    Route::post('uploads/clear', 'API\UploadAPIController@clear');
    Route::post('users/{user}', 'API\UserAPIController@update');

    Route::get('payments/byMonth', 'API\PaymentAPIController@byMonth')->name('payments.byMonth');
    Route::post('payments/wallets/{id}', 'API\PaymentAPIController@wallets')->name('payments.wallets');
    Route::post('payments/cash', 'API\PaymentAPIController@cash')->name('payments.cash');
    Route::resource('payment_methods', 'API\PaymentMethodAPIController')->only([
        'index'
    ]);

    Route::post('e_service_reviews', 'API\EServiceReviewAPIController@store')->name('e_service_reviews.store');


    Route::resource('favorites', 'API\FavoriteAPIController');
    Route::resource('addresses', 'API\AddressAPIController');

    Route::get('notifications/count', 'API\NotificationAPIController@count');
    Route::resource('notifications', 'API\NotificationAPIController');
    Route::resource('bookings', 'API\BookingAPIController');

    Route::resource('earnings', 'API\EarningAPIController');

    Route::resource('e_provider_payouts', 'API\EProviderPayoutAPIController');

    Route::resource('coupons', 'API\CouponAPIController')->except([
        'show'
    ]);
    Route::resource('wallets', 'API\WalletAPIController')->except([
        'show', 'create', 'edit'
    ]);
    Route::get('wallet_transactions', 'API\WalletTransactionAPIController@index')->name('wallet_transactions.index');
});

        //fav services providers of user
        Route::resource('believer', 'API\BeliverController');
        Route::middleware('api_auth')->group(function () {
            Route::post('add_believer', 'API\BeliverController@store')->name('believer.store');
            Route::post('remove_believer', 'API\BeliverController@destroy')->name('believer.destroy');
            Route::post('user_believers_list/{user_id?}', 'API\BeliverController@show')->name('believer.show');
        });

        Route::resource('comment', 'API\CommentController');
        Route::post('add_comment', 'API\CommentController@store')->name('comment.store');
        Route::post('comments_of_media', 'API\CommentController@show')->name('comment.show');
        Route::resource('gallery', 'API\GalleryController');
        Route::post('get_gallery', 'API\GalleryController@show')->name('gallery.show');



