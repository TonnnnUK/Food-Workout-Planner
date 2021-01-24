<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class MealsTest extends TestCase
{

    use DatabaseMigrations;
    
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_a_user_can_see_their_meals()
    {
        $user = User::factory()->create();
        Auth::login($user);
        $response = $this->get("/user/$user->id/meals");
        $response->assertStatus(200);
    }

}
