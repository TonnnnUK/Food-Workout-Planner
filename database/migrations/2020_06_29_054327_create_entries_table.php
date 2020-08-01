<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEntriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('entries', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('recipe_id');
            $table->foreignId('meal_id');
            $table->foreignId('workout_id');
            $table->foreignId('custom_workout_id');
            $table->timestamp('date_time');
            $table->string('entry_type');
            $table->json('entry_data');
            $table->timestamps();
        });

        Schema::table('entries', function(Blueprint $table){
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade');

            $table->foreign('recipe_id')
                ->references('id')
                ->on('recipes')
                ->onDelete('cascade');

            $table->foreign('meal_id')
                ->references('id')
                ->on('meals')
                ->onDelete('cascade');

            $table->foreign('workout_id')
                ->references('id')
                ->on('workouts')
                ->onDelete('cascade');

            $table->foreign('custom_workout_id')
                ->references('id')
                ->on('custom_workouts')
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
        Schema::dropIfExists('entries');

    }
}
