<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * Get the route key for the model.
     *
     * @return string
     */
    public function getRouteKeyName()
    {
        return 'slug';
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'slug', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public static function boot()
    {
        parent::boot();

        self::created(function($user){
            $createLocations = Location::createLocationsForNewUser($user);
        });
    }

    public function role()
    {
        if ($this->id == 1 ) {
            return 'admin';
        } else {
            return 'authuser';
        }
    }

    public function custom_workouts()
    {
        return $this->hasMany(CustomWorkout::class);
    }

    public function meals()
    {
        return $this->hasMany(Meal::class);
    }

    public function locations()
    {
        return $this->hasMany(Location::class);
    }
}
