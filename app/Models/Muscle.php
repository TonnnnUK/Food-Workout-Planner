<?php

namespace App\Models;

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
        return $this->belongsToMany(Tag::class)->withTimestamps();
    }

    public function workouts()
    {
        return $this->belongsToMany(Workouts::class)->withTimestamps();
    }
}
