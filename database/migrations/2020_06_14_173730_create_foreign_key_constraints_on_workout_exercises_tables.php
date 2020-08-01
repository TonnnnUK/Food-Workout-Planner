<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForeignKeyConstraintsOnWorkoutExercisesTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('custom_workout_exercises', function(Blueprint $table){
            $table->foreign('custom_workout_id')
                ->references('id')
                ->on('custom_workouts')
                ->onDelete('cascade');

            $table->foreign('exercise_id')
                ->references('id')
                ->on('exercises')
                ->onDelete('cascade');
        });

        Schema::table('custom_workout_exercise_sets', function(Blueprint $table){
            $table->foreign('workout_exercise_id')
                ->references('id')
                ->on('custom_workout_exercises')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('custom_workout_exercises', function(Blueprint $table){
            $table->dropForeign(['custom_workout_id', 'exercise_id']);
        });

        Schema::table('custom_workout_exercise_sets', function(Blueprint $table){
            $table->dropForeign(['workout_exercise_id']);
        });
    }
}
