@extends('layouts.app')
@section('page-title')
    Workouts Page
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <page-header>Workouts</page-header>

    <workouts-list></workouts-list>
    
    @auth @if ( auth()->user()->id == 1 )
        <button class="btn btn-grey" 
            @click.prevent="$modal.show('workout-modal', {action: 'Create'})">
                Create Workout
        </button>
    @endif @endauth
    
    <workout-modal></workout-modal>

</div>

@endsection
