<?php

namespace App\Http\Livewire\Recipes;

use App\Models\Meal;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class RecipeList extends Component
{
    public function render()
    {
        $recipes = Meal::where('user_id', Auth::user()->id)->get();
        return view('livewire.recipes.recipe-list')->with([
            'user' => Auth::user(),
            'recipes' => $recipes
        ]);;
    }
}
