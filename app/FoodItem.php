<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FoodItem extends Model
{

    public function unit()
    {
        return $this->hasManyThrough('App\Unit', 'App\Meal');
    }
}
