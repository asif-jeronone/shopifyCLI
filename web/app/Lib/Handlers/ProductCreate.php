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
use App\Models\Product;

class ProductCreate implements Handler
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
			Log::info("Shop Two nee to create: " . $store_two->shop);
		}

		if($store_three != '' && $store_tree_active){
			Log::info("Shop Three need to create: " . $store_three->shop);
		}
		





		return;

		
    	// $active_tore = $shop;

    	// $get_store_one = ShopSync::where('store_one', $shop)->first();

    	// $shop_one = Session::where('shop', $get_shop_one->shop_one)->first();
     //    $client_one = new Rest($shop_one->shop, $shop_one->access_token);


     //    $shop_one = Session::where('shop', $shop)->first();
     //    $client_one = new Rest($shop_one->shop, $shop_one->access_token);


        $shop_one = Session::where('shop', $shop)->first();
        $client_one = new Rest($shop_one->shop, $shop_one->access_token);

		
    	
    	$check_product = Product::where('handle',$body['handle'])->first();
    	if($check_product != ''){
    		$productCreated = 'already created';
    	}
    	else{

    		$product = new Product;
    		$product->product_id = $body['id'];
    		$product->title = $body['title'];
    		$product->handle = $body['handle'];
    		$product->save();

    		$session_second = Session::find(32);
        	$client_new = new Rest($session_second->shop, $session_second->access_token);


        	$newVariants = array_map(function($variant) {
		    return [
		        'title' => $variant['title'],
		        'price' => $variant['price'],
		        'sku' => $variant['sku'],
		        'position' => $variant['position'],
		        'compare_at_price' => $variant['compare_at_price'],
		        'option1' => $variant['option1'],
		        'option2' => $variant['option2'],
		        'option3' => $variant['option3'],
		        'inventory_quantity' => $variant['inventory_quantity']
		    ];
		}, $body['variants']);

        	$page_data = array(
	            'product' => array(
	                'title' => $body['title'], 
	                'body_html' => $body['body_html'],
	                'vendor' => $body['vendor'],
	               ' product_type' => $body['product_type'],
	                'status' => $body['status'],
	                'variants'=>$newVariants
	            )
	        );

	        $page = $client_new->post('products', $page_data);
	        $productCreated = $page->getDecodedBody();


	
		    $product_images = $client->get('products/'.$body['id'].'/images');
        	$prd_images = $product_images->getDecodedBody();

        	
        	foreach ($productCreated as  $prd) {
        		$new_prd = $prd['id'];
        	}

        	foreach ($prd_images as $imageUrl) {
		        // Download the image file from the first store
		        $imageData = file_get_contents($imageUrl);

		        // Upload the image to the second store
		        $imageUploadData = array(
		            'image' => array(
		                'attachment' => base64_encode($imageData),
		                'filename' => basename($imageUrl),
		            ),
		        );
		    }

        	foreach ($prd_images as  $images) {
				foreach ($images as  $image) {
					Log::debug($image['src']);
					$client_new->post('products/'.$new_prd.'/images', $image['src']);

				}
			}

	    }



    	//Log::info($check->getDecodedBody());


        // Log::info($prd_images);
        // Log::info('================================================= 1 ========================================================');
         Log::info($body);
        // Log::info('================================================= 2 ========================================================');
        // Log::info($productCreated);
        return;
       // $shop = $page->getDecodedBody();
    }
}
