<?php

namespace Database\Factories;

use App\Models\Workout;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class WorkoutFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Workout::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $words = rand(1, 6);
        $name = $this->faker->sentence($nbWords = $words, $variableNbWords = true);
        
        return [
            'name' => $name,
            'slug' => Str::slug($name),
            'description' => $this->faker->paragraph,
        ];
    }
}
