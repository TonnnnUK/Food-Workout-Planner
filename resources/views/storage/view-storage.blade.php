@extends('layouts.app')
@section('page-title')
    Your Food Inventory: {{$location->name}}
@endsection
@section('content')

<div class="container pt-20 mx-auto">
    
    <page-header>Food Items in your {{$location->name}}</page-header>
    
    <livewire:locations.location-items :location="$location" />
    

</div>

@endsection
