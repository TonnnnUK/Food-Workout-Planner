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
        // View Meal
        //////////////////////////////
        if ( $request->route()->getName() == 'viewMeal' ) {
            // if the meal user (owner) is not equal to the logged in user don't allow access
            if ($request->meal->user != Auth::user()){
                return redirect('403');
            }

        };

        return $next($request);
    }
}
