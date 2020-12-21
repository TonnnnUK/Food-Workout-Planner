<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Location;
use App\Models\CustomWorkout;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use GuzzleHttp\Exception\BadResponseException;

class UserController extends Controller
{

    public function getUser(Request $request)
    {

        return $request->all();

    }

    public function login(Request $request)
    {
        $http = new Client;

        try {
            $response = $http->post(config('services.passport.login_endpoint'), [
                'form_params' => [
                    'grant_type' => 'password',
                    'client_id' => config('services.passport.client_id'),
                    'client_secret' => config('services.passport.client_secret'),
                    'username' => $request->username,
                    'password' => $request->password,
                ]
            ]);
            
            if( Auth::attempt(['email'=>$request->username, 'password'=>$request->password]) ) {
                $user = Auth::user();
            }

            return $response->getBody();
        } catch ( BadResponseException $e) {
            if ($e->getCode() === 400) {
                return response()->json('Invalid Request. Please enter a username or a password.', $e->getCode());
            } else if ($e->getCode() === 401) {
                return response()->json('Your credentials are incorrect. Please try again', $e->getCode());
            }

            return response()->json('Something went wrong on the server.', $e->getCode());
        }

    }

    public function logout()
    {
        auth()->user()->tokens->each(function ($token, $key){
            $token->delete();
        });

        return response()->json('Logged out successfully', 200);
    }


    public function register(Request $request)
    {
        $request->validate ([
            'name' => ['required', 'string', 'max:255', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
        ]);

        return User::create([
            'name' => $request->name,
            'email' => $request->email,
            'slug' => Str::slug($data['name']),
            'password' => Hash::make($request->password),
        ]);
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function dashboard()
    {
        $user = User::with(['custom_workouts', 'meals', 'locations'])
                    ->where('id', Auth::user()->id)
                    ->first();

        return view('dashboard')->with([
            'user' => $user,
        ]);
    }
}
