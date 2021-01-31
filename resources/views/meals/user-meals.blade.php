@extends('layouts.app')
@section('page-title')
    Your Meals
@endsection
@section('content')

    <div class="container pt-20 mx-auto">
        <page-header>Your Meals</page-header>
        <meals-list :meals="{{$meals}}"></meals-list>
    </div>

    @endsection