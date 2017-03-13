<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeedData extends Model
{
    //
    protected $table = 'feed_data';
    public $timestamps = false;

        //フィード収集バッチ情報取得
    public function getFeedData(){
        $feed_data = FeedData::where('status',0)->orderBy('id','desc')->get();
        return $feed_data;
    }
}
