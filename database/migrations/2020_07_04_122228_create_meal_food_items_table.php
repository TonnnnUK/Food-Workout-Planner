<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMealFoodItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('meal_food_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('meal_id');
            $table->foreignId('food_item_id');
            $table->foreignId('unit_id');
            $table->string('unit');
            $table->integer('qty');
            $table->timestamps();

            $table->foreign('meal_id')
                ->references('id')
                ->on('meals')
                ->onDelete('cascade');

            $table->foreign('food_item_id')
                ->references('id')
                ->on('food_items')
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
        Schema::dropIfExists('meal_food_items');
    }
}
