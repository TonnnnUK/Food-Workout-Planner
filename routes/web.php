<?php

use Illuminate\Support\Facades\Route;

/*****************************/
/* **** AUTH / LOGINS ****** */
/*****************************/
Auth::routes();
Route::get('/', function () {
    return view('home');
});
Route::get('sign-in/twitter', 'Auth\LoginController@twitter');
Route::get('sign-in/twitter/redirect', 'Auth\LoginController@twitter_redirect');

/*****************************/
/* ******* PLANNER ******** */
/*****************************/
Route::get('/planner', 'PlannerController@index')->name('planner')->middleware('auth');


/*****************************/
/* ******* WORKOUTS ******** */
/*****************************/
Route::get('/workouts', 'WorkoutsController@index')->name('workout-list');
Route::get('/workout/{workout:slug}', 'WorkoutsController@show')->name('show-workout');

/*****************************/
/* **** CUSTOM WORKOUTS **** */
/*****************************/
Route::get('/create-workout', 'CustomWorkoutsController@create')->name('create-custom-workout')->middleware('auth');
Route::get('/custom-workout/{workout:slug}', 'CustomWorkoutsController@show')->name('show-custom-workout')->middleware('auth');

/*****************************/
/* ******* EXERCISES ******* */
/*****************************/
Route::get('/exercises', 'ExerciseController@index')->name('exercise-list');
Route::get('/exercises/{exercise:slug}', 'ExerciseController@show')->name('show-exercise');

/*****************************/
/* ******* EQUIPMENT ******* */
/*****************************/
Route::get('/equipment', 'EquipmentController@index');
Route::get('/equipment/{equipment:slug}/edit', 'EquipmentController@update')->name('edit-equipment');

/*****************************/
/* ******* MUSCLES ********* */
/*****************************/
Route::get('/muscles', 'MusclesController@index');
Route::get('/muscles/edit', 'MusclesController@edit')->name('admin-muscles');

/*****************************/
/* ********* TAGS ********** */
/*****************************/
Route::get('/tags', 'TagsController@index');
Route::get('/tags/{tags:slug}/edit', 'TagsController@update')->name('edit-tag');

/*****************************/
/* ******* DASHBOARD ******* */
/*****************************/
Route::get('/dashboard', 'UserController@dashboard')->name('dashboard')->middleware('auth');

/*****************************/
/* ******* LOCATIONS ******* */
/*****************************/
Route::get('/user/{user:slug}/locations/{location}', 'StorageController@show')->middleware('auth');
Route::post('/add-location', 'StorageController@create')->middleware('auth');

/*****************************/
/* ****** FOOD ITEMS ******* */
/*****************************/
Route::get('ingredients', 'FoodItemsController@index')->name('ingredients');

/*****************************/
/* ****** FOOD TYPES ******* */
/*****************************/
Route::get('food-types', 'FoodTypesController@index')->name('foodtypes');

/*****************************/
/* ******** RECIPES ******** */
/*****************************/
Route::get('/recipes', 'RecipeController@index')->name('recipes')->middleware('auth');
Route::get('/recipes/add', 'RecipeController@create')->name('add-recipe')->middleware('auth');

/*****************************/
/* ********* MEALS ********* */
/*****************************/
Route::get('user/{user:slug}/meals', 'MealsController@userMeals')->name('userMeals')->middleware(['auth', 'isOwner']);
Route::get('user/{user:slug}/meals/{meal}', 'MealsController@show')->name('viewMeal')->middleware(['auth', 'isOwner']);


