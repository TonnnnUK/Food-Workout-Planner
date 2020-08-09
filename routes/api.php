<?php

use App\Tag;
use App\Muscle;
use App\Workout;
use App\Exercise;
use App\FoodItem;
use App\Equipment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


Route::post('login','UserController@login');
Route::post('register','UserController@register');


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('api')->group(function () {

    /*****************************/
    /* ******* WORKOUTS ******** */
    /*****************************/

    Route::get('workouts', function () {
        return Workout::all();
    });

    Route::get('workouts/{workout:slug}', function (Workout $workout) {
        return $workout;
    });

    Route::post('workout/{workout}/update', 'WorkoutsController@update');
    Route::post('workout/create', 'WorkoutsController@store');


    /*****************************/
    /* **** CUSTOM WORKOUTS **** */
    /*****************************/
    Route::post('custom-workout/create', 'CustomWorkoutsController@store');
    Route::post('custom-workout/{workout}/update', 'CustomWorkoutsController@update');


    /*****************************/
    /* ******* EXERCISES ******* */
    /*****************************/

    Route::get('exercises', function () {
        return Exercise::all();
    });

    Route::get('exercises/{exercise:slug}', function (Exercise $exercise) {
        return $exercise;
    });


    Route::post('exercise/{exercise}/update', 'ExerciseController@update');
    Route::post('exercise/create', 'ExerciseController@store');


    /*****************************/
    /* ******* EQUIPMENT ******* */
    /*****************************/

    Route::get('equipment', function () {
        return Equipment::all();
    });

    Route::get('equipment/{equipment:slug}', function (Equipment $equipment) {
        return $equipment;
    });


    /*****************************/
    /* ******* MUSCLES ********* */
    /*****************************/

    Route::get('muscles', function () {
        return Muscle::all();
    });

    Route::get('muscles/{muscle:slug}', function (Muscle $muscle) {
        return $muscle;
    });


    /*****************************/
    /* ********* TAGS ********** */
    /*****************************/

    Route::get('tags', function () {
        return Tag::all();
    });

    Route::get('tags/{tag:slug}', function (Tag $tag) {
        return $tag;
    });


    /*****************************/
    /* ****** FOOD ITEMS ******* */
    /*****************************/
    Route::get('ingredients', function () {
        return FoodItem::all();
    });


});



Route::middleware('auth:api')->group(function () {    

    
/*****************************/
/* ******** USER ********** */
/*****************************/
    
    Route::post('logout','UserController@logout');

});

