<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Outlet extends Model
{
    protected $guarded = [];
    
    public function getPinpointUrlAttribute(){
        if($this->category_id != 0){
            $url = 'images/pinpoint/pin_1.png';
        }else{
            $url = 'images/pinpoint/pin_1.png';
        }
        $pin_url = asset($url);
        return $pin_url;
    }
}
