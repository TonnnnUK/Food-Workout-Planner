<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Workout extends Model
{

    protected $fillable = [
        'name', 
        'slug', 
        'description', 
        'excerpt', 
        'image', 
        'image_url', 
        'link', 
        'links'
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

    public function equipment()
    {
        return $this->belongsToMany('App\Equipment')->withTimestamps();
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag')->withTimestamps();
    }

    public function muscles()
    {
        return $this->belongsToMany('App\Muscle')->withTimestamps();
    }
}
