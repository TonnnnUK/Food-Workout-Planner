@extends('layouts.app')
@section('page-title')
    Custom Workout // {{$workout->name}}
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <div class="d-block">
        <page-header>{{$workout->name}}</page-header>
    </div>    

    <manage-workout :workout="{{$workout}}" :exercises="{{$workout->exercises}}"></manage-workout>
          
</div>

@endsection
