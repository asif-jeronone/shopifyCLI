<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Shopify\Clients\Rest;
use App\Models\ShopDetail;

class ShopifyController extends Controller{

    public function shopDetails(Request $request)
    {
        $session = $request->get('shopifySession');
        $success = $code = $error = null;

        $client = new Rest($session->getShop(), $session->getAccessToken());
        $result = $client->get('shop');
        $shop = $result->getDecodedBody();
        $shop = $shop['shop'];

        $shop_details = ShopDetail::firstOrNew(['shop_id' => $shop['id']]);
        $shop_details->name = $shop['name'];
        $shop_details->email = $shop['email'];
        $shop_details->domain = $shop['domain'];
        $shop_details->sub_domain = $shop['myshopify_domain'];
        $shop_details->save();


        // $page_data = array('page' => array('title' => 'wishlist', 'body_html' => '<h1>Wishlist</h1>'));
        // $page = $client->post('pages', $page_data);


        return $shop_details; 
        return response()->json(["success" => true, "error" => null, 'message'=>'store founded','datas'=>$shop_details], 200);

    }
}