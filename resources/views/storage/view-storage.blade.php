@extends('layouts.app')
@section('page-title')
    View your {{$location->name}}
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <h1>Food Items in your {{$location->name}}</h1>


</div>

@endsection
