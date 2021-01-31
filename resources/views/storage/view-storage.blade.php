@extends('layouts.app')
@section('page-title')
    View your {{$location->name}}
@endsection
@section('content')

<div class="container pt-20 mx-auto">

    <h1>Food Items in your {{$location->name}}</h1>

    
    <livewire:locations.location-items :location="$location" />
    

</div>

@endsection
