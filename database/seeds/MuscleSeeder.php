<?php

use App\Muscle;
use Illuminate\Database\Seeder;

class MuscleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $muscles = [
            'biceps',
            'chest',
            'triceps',
            'traps',
            'upper back',
            'lats',
            'shoulders',
            'lower back',
            'glutes',
            'hamstrings',
            'quads',
            'calves',
            'forearms',
            'full body',
            'upper abs',
            'lower abs',
            'obliques'
        ];

        foreach ( $muscles as $muscle ) {

            $muscle = Muscle::create([
                'name' => $muscle,
                'slug' => Str::slug($muscle),
                
            ]);

        }
    }
}
