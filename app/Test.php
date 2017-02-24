<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Test extends Model
{
    //
    protected $table = 'test';
    public $timestamps = false;


    public function getTestDataAll(){
        $test_data = Test::all();
        return $test_data;
    }

    public function getTestDataWhere($data){
        if(count($data) >= 2){
            $query = Test::query();
            $query->where('id', $data[0]);
            foreach($data as $datas){
                $query->orwhere('id',$datas);
            }
            $test_data = $query->get();
        }else{
            $test_data = Test::where('id',$data)->get();
        }
        return $test_data;
    }
 
}
