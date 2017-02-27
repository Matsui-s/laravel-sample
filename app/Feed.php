<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Feed extends Model
{
    //
    protected $table = 'feeds';
    public $timestamps = false;

    //フィード収集バッチ情報取得
    public function getFeederData(){
        $feeder_data = Feed::where('status',0)->get();
        return $feeder_data;
    }
}
