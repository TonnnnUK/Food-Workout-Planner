<?php

namespace App\Http\Livewire;

use Livewire\Component;

class SiteFooter extends Component
{

    public $name = 'Ton';

    public function mount()
    {
        $this->name = 'Changed';
    }

    public function hydrate()
    {
        $this->name = 'Hydrated';
    }

    public function resetName()
    {
        $this->name = "Ton";
    }

    public function render()
    {
        return view('livewire.site-footer', [
            'test' => 'Whattttt'
        ]);
    }
}
