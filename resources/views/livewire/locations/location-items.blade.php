<div class="flex">
    <div class="w-full md:w-3/4 flex flex-row flexwrap">
        @foreach($items as $item)
            <div class="w-full flex">
                <div>{{$item->name}}</div>
                <div>{{$item->qty}}</div>
                <div>{{$item->unit_id}}</div>
            </div>
        @endforeach
    </div>

    <div class="flex flex-col w-full md:w-1/4 mb-5">
        <p class="mb-3">Add Items</p>

        <input class="p-2 mb-2" placeholder="Food Item" type="text" name="foodSearch" wire:model="foodSearch" wire:keydown.debounce.150ms="searchFoodItems" />


        <input class="p-2 mb-2" placeholder="Qty" type="text" name="qty" wire:model="addQty" />
        <select class="p-2 mb-2" name="unit" wire:model="addUnit">
            <option  value="">-- Select Unit --</option>
            @foreach($units as $unit)
                <option value="{{$unit->id}}">{{$unit->name}} ({{$unit->label}})</option>
            @endforeach
        </select>
        
        <button class="bg-gray-700 p-2 text-white" wire:click="addItemToLocation">Add to {{$location->name}}</button>
        
        <br>
        adding item: {{$foodSearch}}
        <br>

        
        <div class="flex flex-col">
            @foreach($foodSearchResults as $item)
                <span>{{$item->name}}</span>
            @endforeach
        </div>

    </div>

</div>