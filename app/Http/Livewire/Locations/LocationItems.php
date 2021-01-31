<?php

namespace App\Http\Livewire\Locations;

use Livewire\Component;

class LocationItems extends Component
{

    public $location;
    public $items;
    public $addItem;

    public function render()
    {

        $this->items = $this->location->items;

        return view('livewire.locations.location-items');
    }
}
