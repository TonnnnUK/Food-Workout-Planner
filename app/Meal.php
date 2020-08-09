<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function ingredients()
    {
        return $this->belongsToMany('App\FoodItem', 'meal_food_items', 'meal_id', 'food_item_id')
                    ->withPivot(['qty', 'unit', 'unit_id'])
                    ->withTimestamps();
    }
}
