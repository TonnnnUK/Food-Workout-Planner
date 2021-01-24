@extends('layouts.app')
@section('page-title')
    Your Recipes
@endsection
@section('content')

    <div class="container mx-auto pt-20">
        <page-header>Your Recipes</page-header>

        <livewire:recipes.recipe-list/>
        
    </div>

    @endsection