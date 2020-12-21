<?php

namespace Database\Seeders;

use App\Models\Meal;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class MealsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        
        $bolognase = Meal::create([
            'name' => 'Tons Bolognase',
            'servings' => 4,
            'description' => 'World class meal',
            'method' => 'World class meal',
            'link' => 'none',
            'image' => 'none',
            'user_id' => 1
        ]);


        $bolognase->ingredients()->attach($bolognase->id, [
            
                'food_item_id' => 6, 
                'qty' => 500,
                'unit_id' => 9,
                'unit' => 'grams',
        ]);


        $chilliChicken = Meal::create([
            'name' => 'Charred Chilli Chicken',
            'servings' => 4,
            'description' => 'World class meal',
            'method' => 'World class meal',
            'link' => 'none',
            'image' => 'none',
            'user_id' => 1
        ]);


        $chilliChicken->ingredients()->attach($chilliChicken->id, [
            
                'food_item_id' => 2, 
                'qty' => 500,
                'unit_id' => 9,
                'unit' => 'grams',
        ]);
        
    }
}
