<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Workout extends Model
{

    use HasFactory;

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
        return $this->belongsToMany(Equipment::class)->withTimestamps();
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class)->withTimestamps();
    }

    public function muscles()
    {
        return $this->belongsToMany(Muscle::class)->withTimestamps();
    }
}
