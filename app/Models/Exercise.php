<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Exercise extends Model
{

    protected $protected = [];


    public function muscles()
    {
        return $this->belongsToMany(Muscle::class)->withTimestamps();
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class)->withTimestamps();
    }

    public function equipment()
    {
        return $this->belongsToMany(Equipment::class)->withTimestamps();
    }

    public function custom_workouts()
    {
        return $this->belongsToMany(CustomWorkout::class, 'custom_workout_exercises')->withTimestamps();
    }
}
