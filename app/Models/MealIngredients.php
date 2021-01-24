<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MealIngredients extends Model
{
    protected $table = 'meal_food_items';

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
}
