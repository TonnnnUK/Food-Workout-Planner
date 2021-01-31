<div class="flex mb-5">
    <p>Add Items</p>

    <input type="text" name="item" wire:model="addItem" /><br>
    adding item: {{$addItem}}
</div>

<div class="flex flex-row flexwrap">
    @foreach($items as $item)
        <div class="w-full md:w-1/2">
            {{$item->name}}
        </div>
    @endforeach
</div>