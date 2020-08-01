@extends('layouts.app')
@section('page-title')
    Your Meals
@endsection
@section('content')

    <div class="container mx-auto pt-20">
        <page-header>Your Meals</page-header>
    
        <meals-list :meals="{{$meals}}"></meals-list>
    </div>

    @endsection