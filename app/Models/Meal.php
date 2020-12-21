<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function ingredients()
    {
        return $this->belongsToMany(FoodItem::class, 'meal_food_items', 'meal_id', 'food_item_id')
                    ->withPivot(['qty', 'unit', 'unit_id'])
                    ->withTimestamps();
    }
}
