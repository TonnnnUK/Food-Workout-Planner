<?php

use Illuminate\Database\Seeder;

class TagsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $tags = [
            'Jump Rope',
            'Cardio',
            'Resource',
            'Muscle Group Focus',
            'Small Space',
            'Ladder',
            'YouTube',
            'Circuits',
            'Workout Program',
            'Single Workout',
            'Quick',
            'Bodyweight Only',
            'Full Body',
            'Compound',
        ];

        foreach ( $tags as $tag) {        

            $t = App\Tag::create([
                'name' => $tag,
                'slug' => Str::slug($tag),
            ]);
        }

    }
}
