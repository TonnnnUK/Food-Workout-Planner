@extends('layouts.app')
@section('page-title')
    {{$meal->name}} recipe
@endsection
@section('content')

    <div class="container mx-auto pt-20">
        <page-header>{{$meal->name}}</page-header>
    
        <meal-info :meal="{{$meal}}" :ingredients="{{$meal->ingredients}}"></meal-info>
    </div>

    @endsection