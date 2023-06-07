<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Shopify\Clients\Rest;
use App\Models\ShopDetail;

class ProductController extends Controller{

    public function index(Request $request)
    {
        $session = $request->get('shopifySession');
        $client = new Rest($session->getShop(), $session->getAccessToken());
        $result = $client->get('products', ['limit' => 10]);
        $data = $result->getDecodedBody();
        return $data['products'];
    }
}