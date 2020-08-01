<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Muscle extends Model
{

    /**
     * Get the route key for the model.
     *
     * @return string
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function exercises()
    {
        return $this->belongsToMany('App\Tag')->withTimestamps();
    }

    public function workouts()
    {
        return $this->belongsToMany('App\Workouts')->withTimestamps();
    }
}
