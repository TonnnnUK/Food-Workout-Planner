<?php

namespace App\Http\Controllers;

use App\Workout;
use Illuminate\Http\Request;

class WorkoutsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('workouts.workouts-index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $workout = Workout::create([
            'name' => $request->name, 
            'slug' => $request->slug, 
            'description' => $request->description 
        ]);

        return $workout;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Workout $workout)
    {
        return view('workouts.workout-info')->with('workout', $workout);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Workout $workout, Request $request)
    {
        $updated = Workout::find($workout->id);
        $updated->name = $request->name;
        $updated->slug = $request->slug;
        $updated->description = $request->description;
        $updated->save();
        
        return response()->json([
            'workout' => $updated,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function getWorkouts()
    {
        return Workouts::all();
    }
}
