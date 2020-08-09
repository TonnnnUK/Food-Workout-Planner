<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForeignKeyConstraintsOnWorkoutsExercises extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::table('workout_equipment', function(Blueprint $table){
            $table->foreign('workout_id')
                ->references('id')
                ->on('workouts')
                ->onDelete('cascade');

            $table->foreign('equipment_id')
                ->references('id')
                ->on('equipment')
                ->onDelete('cascade');
        });

        Schema::table('workout_muscles', function(Blueprint $table){
            $table->foreign('workout_id')
                ->references('id')
                ->on('workouts')
                ->onDelete('cascade');

            $table->foreign('muscle_id')
                ->references('id')
                ->on('muscles')
                ->onDelete('cascade');
        });
        
        Schema::table('workout_tags', function(Blueprint $table){
            $table->foreign('workout_id')
                ->references('id')
                ->on('workouts')
                ->onDelete('cascade');

            $table->foreign('tag_id')
                ->references('id')
                ->on('tags')
                ->onDelete('cascade');
        });
          

        Schema::table('exercises_equipment', function(Blueprint $table){
            $table->foreign('exercise_id')
                ->references('id')
                ->on('exercises')
                ->onDelete('cascade');

            $table->foreign('equipment_id')
                ->references('id')
                ->on('equipment')
                ->onDelete('cascade');
        });
        

        Schema::table('exercise_muscles', function(Blueprint $table){
            $table->foreign('exercise_id')
                ->references('id')
                ->on('exercises')
                ->onDelete('cascade');

            $table->foreign('muscle_id')
                ->references('id')
                ->on('muscles')
                ->onDelete('cascade');
        });
        

        Schema::table('exercise_tags', function(Blueprint $table){
            $table->foreign('exercise_id')
                ->references('id')
                ->on('exercises')
                ->onDelete('cascade');

            $table->foreign('tag_id')
                ->references('id')
                ->on('tags')
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
        //
    }
}
