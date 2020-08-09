@extends('layouts.app')
@section('page-title')
    Log In
@endsection
@section('content')
<div class="container flex justify-center mx-auto pt-20">
        <form class="bg-white shadow-2xl rounded px-8 pt-6 pb-8 mb-4 w-4/5 md:w-3/4 lg:w-1/2" method="POST" action="{{ route('login') }}">
            @csrf

            <div class="px-6 py-4">
                <div class="font-bold text-xl mb-2">Login</div>
            </div>
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email" class="">Email Address</label>

                <div class="">
                    <input id="email" type="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('email') border border-red-500  @enderror" name="email" 
                            value="{{ old('email') }}" required autocomplete="email" autofocus>

                    @error('email')
                        <span class="" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
            </div>

            <div class="mb-6">
                <label for="password" class="">{{ __('Password') }}</label>

                <div class="block text-gray-700 text-sm font-bold mb-2">
                    <input id="password" type="password" 
                            class="shadow appearance-none rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none 
                                    focus:shadow-outline @error('password') border border-red-500 @enderror" name="password" required autocomplete="current-password">

                    @error('password')
                        <span class="" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
            </div>
            
            <div class="flex items-center">
                <input class="mr-5" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                <label class="" for="remember">
                    {{ __('Remember Me') }}
                </label>
            </div>

            <div class="flex items-center my-4">
                <button type="submit" class="btn btn-blue">
                    {{ __('Login') }}
                </button>

                @if (Route::has('password.request'))
                    <a class="inline-block ml-3 align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="{{ route('password.request') }}">
                        {{ __('Forgot Your Password?') }}
                    </a>
                @endif
            </div>

            <div class="flex items-center justify-between my-4">
                <a href="/sign-in/twitter" class="bg-blue-twitter hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Sign in with Twitter
                </a>
                <a href="/sign-in/google" class="bg-red-google hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Sign in with Google
                </a>
                <a href="/sign-in/facebook" class="bg-blue-facebook hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Sign in with Facebook
                </a>
            </div>
        </form>

</div>
@endsection
