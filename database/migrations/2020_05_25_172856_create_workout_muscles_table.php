<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWorkoutMusclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workout_muscles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('workout_id');
            $table->unsignedBigInteger('muscle_id');
            $table->tinyInteger('primary');
            $table->tinyInteger('secondary');
            $table->tinyInteger('tertiary');
            $table->timestamps();

            $table->foreign('workout_id')
            ->references('id')
            ->on('workouts')
            ->onDelete('cascade');

            $table->foreign('muscle_id')
                ->references('id')
                ->on('muscles')
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
        Schema::dropIfExists('workout_muscles');
    }
}
