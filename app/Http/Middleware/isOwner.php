<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class isOwner
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        ///////////////////////////////
        // View All User Meals
        //////////////////////////////
        if ( $request->route()->getName() == 'userMeals' ) {
            // if user (owner) is not equal to the logged in user don't allow access
            if (!Auth::check() || $request->user->id != Auth::user()->id){
                return abort('401');
            }

        };

        ///////////////////////////////
        // View Meal
        //////////////////////////////
        if ( $request->route()->getName() == 'viewMeal' ) {
            
            // if the meal user (owner) is not equal to the logged in user don't allow access
            if (Auth::check() && $request->meal->user != Auth::user()){
                return abort('401');
            }

        };

    

        return $next($request);
    }
}
