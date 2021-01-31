<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserFoodItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_food_items', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignId('food_item_id');
            $table->foreignId('user_id');
            $table->foreignId('location_id');
            $table->string('qty')->nullable();
            $table->foreignId('unit_id')->nullable();
            $table->date('date_in');
            $table->date('date_out')->nullable();
            $table->integer('days_expire')->nullable();
            $table->boolean('freezeable')->nullable();

        });

        Schema::table('user_food_items', function(Blueprint $table){
            $table->foreign('food_item_id')
                    ->references('id')
                    ->on('food_items')
                    ->onDelete('cascade');

            $table->foreign('user_id')
                    ->references('id')
                    ->on('users')
                    ->onDelete('cascade');

            $table->foreign('location_id')
                    ->references('id')
                    ->on('locations')
                    ->onDelete('cascade');

            $table->foreign('unit_id')
                    ->references('id')
                    ->on('units')
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
        Schema::dropIfExists('user_food_items');
    }
}
