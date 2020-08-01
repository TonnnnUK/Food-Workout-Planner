<?php

namespace App\Http\Controllers;

use App\CustomWorkout;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomWorkoutsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('customworkout.create-workout');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) 
    {

        $workout = CustomWorkout::create([
            'name' => $request->name,
            'slug' => CustomWorkout::createSlug($request->user_slug, $request->name),
            'notes' => $request->notes,
            'routine' => $request->routine,
            'user_id' => intval($request->user_id),
        ]);

        $workout->exercises()->attach(explode(',', $request->exercises));

        return response()->json([
            'workout' => $workout
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(CustomWorkout $workout)
    {
        return view('customworkout.custom-workout-info')->with([
            'workout'   => $workout,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CustomWorkout $workout, Request $request)
    {

        $updated = CustomWorkout::find($workout->id);
        $updated->name = $request->name;
        $updated->slug = $request->slug;
        $updated->notes = $request->notes;
        $updated->routine = $request->routine;
        $updated->save();
        
        return response()->json([
            'success' => 'Workout updated',
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
}
