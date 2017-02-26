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
            foreach($data as $datas){
                $query->orwhere('id',$datas);
            }
        }else{
            $query->where('id',$data);
        }
        $test_data = $query->get();
        return $test_data;
    }
 
}
