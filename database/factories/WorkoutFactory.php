<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Workout;
use Faker\Generator as Faker;

$factory->define(Workout::class, function (Faker $faker) {
    
    $words = rand(1, 6);
    $name = $faker->sentence($nbWords = $words, $variableNbWords = true);
    
    return [
        'name' => $name,
        'slug' => Str::slug($name),
        'description' => $faker->paragraph,
    ];
});
