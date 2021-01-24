<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    public function ingredients()
    {
        return $this->belongsToMany('App\FoodItem', 'recipe_food_items');
    }
}
