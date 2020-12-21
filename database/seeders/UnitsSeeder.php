<?php

namespace Database\Seeders;
    
use App\Models\Unit;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class UnitsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $unit = Unit::create([
                'name' => 'teaspoon',
                'label' => 'tsp'
            ]);

        $unit = Unit::create([
                'name' => 'tablespoon',
                'label' => 'tbsp'
            ]);

        $unit = Unit::create([
                'name' => 'pints',
                'label' => 'pints'
            ]);

        $unit = Unit::create([
                'name' => 'ounces',
                'label' => 'oz'
            ]);

        $unit = Unit::create([
                'name' => 'meal',
                'label' => 'meal'
            ]);

        $unit = Unit::create([
                'name' => 'litres',
                'label' => 'lt'
            ]);

        $unit = Unit::create([
                'name' => 'millilitres',
                'label' => 'ml'
            ]);

        $unit = Unit::create([
                'name' => 'kilogram',
                'label' => 'kg'
            ]);

        $unit = Unit::create([
                'name' => 'gram',
                'label' => 'g'
            ]);

        $unit = Unit::create([
                'name' => 'fillet',
                'label' => 'fillet'
            ]);

    }
}
