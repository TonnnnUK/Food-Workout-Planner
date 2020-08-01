@extends('layouts.app')
@section('page-title')
    Workout Page
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <workout-info :workout="{{$workout}}"></workout-info>

    <workout-modal ></workout-modal>
</div>

@endsection
