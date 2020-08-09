@extends('layouts.app')
@section('page-title')
    Exercise Page
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <exercise-info :exercise="{{$exercise}}"></exercise-info>

    <exercise-modal ></exercise-modal>
</div>

@endsection
