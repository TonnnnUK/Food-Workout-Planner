<?php

namespace Database\Factories;

use App\Models\Meal;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class MealFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Meal::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->title,
            'servings' => $this->faker->title,
            'description' => $this->faker->title,
            'method' => $this->faker->title,
            'link' => $this->faker->title,
            'image' => $this->faker->title,
            'user_id' => User::factory(),
        ];
    }
}
