<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Test;

class TestController extends Controller
{
    //
    public function index(){
        //インスタンス作成
        $test_model = new Test;
//        $test_data = $test_model->getTestDataAll();
        $data = array(1,2,4);
        $test_data = $test_model->getTestDataWhere($data);

        return view('test', [
        "members" => $test_data
        ]);
    }
}
