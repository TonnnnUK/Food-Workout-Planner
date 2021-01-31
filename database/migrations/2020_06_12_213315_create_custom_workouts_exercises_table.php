<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomWorkoutsExercisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('custom_workout_exercises', function (Blueprint $table) {
            $table->id();
            $table->foreignId('custom_workout_id');
            $table->foreignId('exercise_id');
            $table->timestamps();

            $table->foreign('custom_workout_id')
                ->references('id')
                ->on('custom_workouts')
                ->onDelete('cascade');

            $table->foreign('exercise_id')
                ->references('id')
                ->on('exercises')
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
        Schema::dropIfExists('custom_workout_exercises');
    }
}
