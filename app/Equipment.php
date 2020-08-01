<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Equipment extends Model
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

    public function muscles()
    {
        return $this->belongsToMany('App\Muscle')->withTimestamps();
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag')->withTimestamps();
    }
}
