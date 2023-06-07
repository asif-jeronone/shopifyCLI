<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Shopify\Clients\Rest;
use Shopify\Utils;
use App\Models\ShopDetail;
use App\Models\Session;
use App\Models\EmailProductUpdate;
use Illuminate\Support\Facades\Log;

class EmailSettingController extends Controller{

    public function productGet(Request $request)
    {
        $session = $request->get('shopifySession');
        $client = new Rest($session->getShop(), $session->getAccessToken());

        $setting = EmailProductUpdate::where(['shop' => $session->getShop()])->first();
        if(empty($setting)){
            $setting = EmailProductUpdate::firstOrNew(['shop' => $session->getShop()]);
            $setting->heading = 'Notify me when available';
            $setting->save();
        }
        return $setting; 
    }

    public function productUpdate(Request $request)
    {

        $session = $request->get('shopifySession');
        $client = new Rest($session->getShop(), $session->getAccessToken());

        $setting = EmailProductUpdate::firstOrNew(['shop' => $session->getShop()]);
        $setting->heading = $request->heading;
        $setting->body_content = $request->bodyContent;
        $setting->save();
        return $setting; 
    }

    public function productCreate(Request $request){
        $session = $request->get('shopifySession');
        $client = new Rest($session->getShop(), $session->getAccessToken());

        $page_data = array(
            'product' => array(
                'title' => $request->heading, 
                'body_html' => $request->bodyContent,
                'vendor' => "Burton",
               ' product_type' => "Snowboard",
                'status' => "active"
            )
        );

        $page = $client->post('products', $page_data);
        $shop = $page->getDecodedBody();
        Log::info('First');
        Log::info($shop);


        Log::info('==========================================================');
        $session = Session::find(27);
        $client = new Rest($session->shop, $session->access_token);

        $page_data = array(
            'product' => array(
                'title' => $request->heading, 
                'body_html' => $request->bodyContent,
                'vendor' => "Burton",
               ' product_type' => "Snowboard",
                'status' => "active"
            )
        );

        $page = $client->post('products', $page_data);
        $shop = $page->getDecodedBody();
        Log::info('Second');
        Log::info($shop);
    }
}