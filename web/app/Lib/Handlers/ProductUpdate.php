<?php
declare(strict_types=1);
namespace App\Lib\Handlers;

use Illuminate\Support\Facades\Log;
use Shopify\Webhooks\Handler;
use App\Models\Session;
use App\Models\ShopSync;
use Illuminate\Http\Request;
use Shopify\Clients\Rest;
use Shopify\Utils;
use App\Models\ShopDetail;

class ProductUpdate implements Handler
{
    public function handle(string $topic, string $shop, array $body): void
    {
		$store_one = '';
		$store_two = '';
		$store_three = '';

		$store_one_active = false;
		$store_two_active = false;
		$store_three_active = false;
		
		$store_one_check = ShopSync::where('store_one', $shop)->first();
		if($store_one_check){
			$store_one_active = true;
			$store_one = Session::where('shop', $store_one_check->store_one)->first();
        	$client_one = new Rest($store_one->shop, $store_one->access_token);
			
			if($store_one_check->store_two != ''){
				$store_two = Session::where('shop', $store_one_check->store_two)->first();
        		$client_two = new Rest($store_two->shop, $store_two->access_token);
			}
			

			if($store_one_check->store_three != ''){
				$store_three = Session::where('shop', $store_one_check->store_three)->first();
				$client_one = new Rest($store_three->shop, $store_three->access_token);
			}
		}

		
		$store_two_check = ShopSync::where('store_two', $shop)->first();
		if($store_two_check){

			if($store_two_check->store_one != ''){
				$store_one = Session::where('shop', $store_two_check->store_one)->first();
				$client_one = new Rest($store_one->shop, $store_one->access_token);
			}

			$store_two_active = true;
			$store_two = Session::where('shop', $store_two_check->store_two)->first();
			$client_two = new Rest($store_two->shop, $store_two->access_token);

			if($store_two_check->store_three != ''){
				$store_three = Session::where('shop', $store_two_check->store_three)->first();
				$client_one = new Rest($store_three->shop, $store_three->access_token);
			}
		}

		$store_three_check = ShopSync::where('store_three', $shop)->first();
		if($store_three_check){
			if($store_three_check->store_one != ''){
				$store_one = Session::where('shop', $store_three_check->store_one)->first();
				$client_one = new Rest($store_one->shop, $store_one->access_token);
			}

			if($store_three_check->store_two != ''){
				$store_two = Session::where('shop', $store_three_check->store_two)->first();
				$client_two = new Rest($store_two->shop, $store_two->access_token);
			}

			$store_three_active = true;
			$store_three = Session::where('shop', $store_three_check->store_three)->first();
        	$client_one = new Rest($store_three->shop, $store_three->access_token);
		}



		if($store_one != '' && $store_one_active == false){
			Log::info("Shop One need to create: " . $store_one->shop);
		}

		if($store_two != '' && $store_two_active == false){
			Log::info("Shop Two need to create: " . $store_two->shop);
		}

		if($store_three != '' && $store_tree_active){
			Log::info("Shop Three need to create: " . $store_three->shop);
		}

		return;
		

    }
}
