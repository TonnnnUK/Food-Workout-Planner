<?php

use App\Equipment;
use Illuminate\Database\Seeder;

class EquipmentSeeder extends Seeder
{

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $equipment = [
            'barbell',
            'dumbbells',
            'flat bench',
            'squat rack',
            'pull up bar',
            'dip bars / station',
            'suspension trainer',
            'incline bench',
            'decline bench',
            'ez curl bar',
            'low pulley',
            'high pulley',
            'chair(s)',
            'stick / broom',
            'bodyweight',
            'step',
        ];

        foreach ( $equipment as $eq ) {

            $e = Equipment::create([
                'name' => $eq,
                'slug' => Str::slug($eq),
                'description' => 'description'
            ]);

        }
    }
}
