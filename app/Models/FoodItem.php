<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FoodItem extends Model
{

    public function unit()
    {
        return $this->hasManyThrough(Unit::class, Meal::class);
    }
}
