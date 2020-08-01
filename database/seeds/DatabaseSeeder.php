<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UserSeeder::class);
        $this->call(MuscleSeeder::class);
        $this->call(TagsSeeder::class);
        $this->call(WorkoutSeeder::class);
        $this->call(ExerciseSeeder::class);
        $this->call(EquipmentSeeder::class);
        $this->call(FoodItemsSeeder::class);
        $this->call(UnitsSeeder::class);
        $this->call(MealsSeeder::class);
    }
}
