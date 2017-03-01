<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FeedData extends Model
{
    //
    protected $table = 'feed_data';
    public $timestamps = false;

        //フィード収集バッチ情報取得
    public function getFeedData($linkHash,$link){
        $fddt = FeedData::where('link_hash',$linkHash)->where('link',$link)->get();
        return $fddt;
    }
}
