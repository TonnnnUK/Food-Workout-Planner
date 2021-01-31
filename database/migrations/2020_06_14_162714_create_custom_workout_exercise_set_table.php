<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomWorkoutExerciseSetTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('custom_workout_exercise_sets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('workout_exercise_id');
            $table->integer('reps')->nullable(); 
            $table->integer('time')->nullable(); 
            $table->integer('weight')->nullable(); 
            $table->string('unit')->nullable(); 
            $table->timestamps();

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
        Schema::dropIfExists('custom_workout_exercise_set');
    }
}
