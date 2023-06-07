<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\EmailSettingController;
use App\Http\Controllers\Admin\WishlistController;
use App\Http\Controllers\Admin\ShopifyController;
use App\Http\Controllers\Admin\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/', function () {
    return "Hello API";
});


Route::middleware('shopify.auth')->controller(EmailSettingController::class)->group(function(){
    Route::post('/email/product-update', 'productUpdate');
    Route::post('/product-create', 'productCreate');
    Route::get('/email/product-get', 'productGet');
});

Route::middleware('shopify.auth')->controller(ProductController::class)->group(function(){
    Route::get('/product/list', 'index');
});

Route::middleware('shopify.auth')->controller(ShopifyController::class)->group(function(){
    Route::get('/shop/details', 'shopDetails');
});