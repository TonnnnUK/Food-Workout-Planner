<?php

namespace App\Http\Livewire\Locations;

use App\Models\Unit;
use Livewire\Component;
use App\Models\FoodItem;

class LocationItems extends Component
{

    public $location;
    public $items;
    public $units;
    public $foodSearch;
    public $foodSearchResults;

    
    public function searchFoodItems()
    {
        $this->foodSearchResults = FoodItem::where('name', 'like', "%$this->foodSearch%")->get();
    
    }

    public function addItemToLocation()
    {
        
        $newFood = new FoodItem;

    }

    public function render()
    {

        $this->items = $this->location->items;
        $this->units = Unit::all();
        $this->foodSearchResults = [];
        
        return view('livewire.locations.location-items');
    }


}
