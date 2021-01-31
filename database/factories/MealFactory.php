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
            'name' => $this->faker->word,
            'servings' => $this->faker->sentence(6, true),
            'description' => $this->faker->sentence(15, true),
            'method' => $this->faker->sentence(15, true),
            'link' => $this->faker->domainName,
            'image' => $this->faker->imageUrl,
            'user_id' => User::factory(),
        ];
    }
}
