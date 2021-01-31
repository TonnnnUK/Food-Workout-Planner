@extends('layouts.app')
@section('page-title')
    Dashboard
@endsection
@section('content')

    <div class="container pt-20 mx-auto">
        
        <page-header>Dashboard</page-header>



        <div class="flex">

            <div class="w-1/3">
                <strong>Your Custom Workouts</strong>
                
                @isset ($user->custom_workouts)
                @foreach ($user->custom_workouts as $workout)
                    <div>
                        <a href="{{ route('show-custom-workout', $workout->slug) }}">
                        {{ $workout->name }}</a>
                    </div>
                @endforeach
                @endisset

                <div>
                    <a href="/create-workout">
                        <button class="btn btn-grey">Create A Workout</button>
                    </a>
                </div>

            </div>

            <div class="w-1/3">
                <strong>Your Recipes</strong>
                @foreach ($user->meals as $meal)
                    <div>
                        <a href="user/{{ Auth::user()->slug }}/meals/{{$meal->id}}">{{ $meal->name }}</a>
                        <small>- remove</small>
                    </div>
                @endforeach
                <a class="block mt-5" href="{{route('userMeals', Auth::user()->slug)}}">See all recipes</a>
            </div>


            <div class="w-1/3">
                <strong>Your Food Storage</strong>
                @isset ($user->locations)
                    @foreach ($user->locations as $location)
                        <div>
                            <a href="user/{{ Auth::user()->slug }}/locations/{{$location->id}}">{{ $location->name }}</a>
                            @if( !$location->required) <small>- remove</small> @endif
                        </div>
                    @endforeach
                @endisset

                <form class="mt-5" method="POST" action="/add-location">
                    @csrf
                    <input type="text" name="name" class="p-2" placeholder="e.g fridge, cupboard" />
                    <button class="btn btn-grey">Create</button>
                </form>
            </div>

        </div>


        <div class="flex flex-col my-5">

                <h2 class="text-lg md:text-2xl">Been shopping?</h2>

                <manage-inventory></manage-inventory>

        </div>

    </div>

@endsection