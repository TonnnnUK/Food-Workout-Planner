@extends('layouts.app')
@section('page-title')
    Muscles Page
@endsection
@section('content')

<div class="container mx-auto pt-20">

    <page-header>Muscles</page-header>

    <muscles-list></muscles-list>


    @auth @if ( auth()->user()->id == 1 )
        <button class="btn btn-grey" 
            @click.prevent="$modal.show('muscle-modal', {action: 'Create Muscle'})">
                Create Muscle
        </button>
    @endif @endauth

    <muscle-modal ></muscle-modal>

</div>

@endsection
