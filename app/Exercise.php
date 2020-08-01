<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Exercise extends Model
{

    protected $fillable = [
        'name', 
        'slug', 
        'description', 
        'excerpt', 
        'image', 
        'video_url', 
        'type_id'
    ];

    // /**
    //  * Get the route key for the model.
    //  *
    //  * @return string
    //  */
    // public function getRouteKeyName()
    // {
    //     return 'slug';
    // }

    public function muscles()
    {
        return $this->belongsToMany('App\Muscle')->withTimestamps();
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag')->withTimestamps();
    }

    public function equipment()
    {
        return $this->belongsToMany('App\Equipment')->withTimestamps();
    }

    public function custom_workouts()
    {
        return $this->belongsToMany('App\CustomWorkout', 'custom_workout_exercises')->withTimestamps();
    }
}
