<template>
  <header class="container-fluid flex flex-row items-center justify-between px-2 py-5 bg-gray-800 text-white fixed w-full shadow-lg">
    <div>
        <div class="menu-icon">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <a class="flex text-center" href="/">
            <h1 class="text-lg"><i class="fas fa-dumbbell"></i> <i class="fas fa-utensils"></i></h1>
        </a>
    </div>

    <ul class="flex">
        <li class="mx-3" v-if="userLoggedIn">
            <a href="/planner">Planner</a>
        </li>
        <li class="mx-5">
            <a href="/exercises">
                Exercises
            </a>
        </li>
        <li class="mx-5">
            <a href="/workouts">
                Workouts
            </a>
        </li>
        <li class="mx-5">
            <a href="/recipes">
                Recipes
            </a>
        </li>    
        
        <!-- Login or Register -->
        <li class="mx-3" v-if="!userLoggedIn">
            <a class="" href="/login">Login</a>
        </li>
        
        <li class="" v-if="!userLoggedIn">
            <a class="" href="/register">Register</a>
        </li>
        <li class="mx-3" v-if="userLoggedIn">
            <a class="" href="/dashboard" role="button">
                <i class="fas fa-user"></i> {{ user.name }}
            </a>
        </li>

        <!-- User info & logout -->
        <li class="mx-3" v-if="userLoggedIn">
            <a href="/logout"
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
                <i class="fas fa-sign-out-alt"></i>
            </a>
            <form id="logout-form" action="/logout" method="POST" style="display: none;">
                <input type="hidden" name="_token" :value="csrf">
            </form>
        </li>
    </ul>
</header>
</template>

<script>

export default {

    props: ['user', 'role'],

    data(){
        return {
          userLoggedIn: false,
          csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')       
        }
    },

    created: function() {
    
        if ( this.user != 'null' ) {  
            window.user = this.user
            window.user.role = this.role
            this.userLoggedIn = true
        } 

    }

}
</script>

<style>

</style>