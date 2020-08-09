<?php

namespace App;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;

class CustomWorkout extends Model
{
    
    protected $fillable = [
        'name', 
        'slug', 
        'notes',
        'routine',
        'user_id',
    ];

    protected $casts = [
        'routine' => 'array',
    ];


    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag')->withTimestamps();
    }

    public function exercises() {
        return $this->belongsToMany('App\Exercise', 'custom_workout_exercises')->withTimestamps();
    }

    public static function createSlug($user, $title)
    {
        $slug = Str::slug($user .' '. $title);

        $count = CustomWorkout::where('slug', $slug)->count();
        if ( $count > 0 ){
            $slug = $slug .'-'. intval( $count+1 );
        }

        return $slug;

    }
}
