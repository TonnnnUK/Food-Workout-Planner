@extends('layouts.app')
@section('page-title')
    Exercises Page
@endsection
@section('content')

<div class="container pt-20 mx-auto">

    <h1>Exercises</h1>

    @auth @if ( auth()->user()->id == 1 )
        <button class="mb-5 btn btn-grey" 
            @click.prevent="$modal.show('exercise-modal', {action: 'Create'})">
                Create Exercise
        </button>
    @endif @endauth

    <exercise-list></exercise-list>
    
    <exercise-modal></exercise-modal>
    
</div>

@endsection
