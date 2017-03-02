<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\FeedData;

class FeedDataController extends Controller
{
    public function index(){
        //インスタンス作成
        $feed_data_ins = new FeedData;
        $feed_data = $feed_data_ins->getFeedData();

        return view('articles', [
            "feeds" => $feed_data
        ]);
   }
}
