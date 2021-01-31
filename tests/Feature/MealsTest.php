<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Meal;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\DatabaseMigrations;


class MealsTest extends TestCase
{

    use DatabaseMigrations;
    use RefreshDatabase;
    
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_only_a_user_can_see_their_own_meals()
    {
        $user = User::factory()->create();
        $meal = Meal::factory()->make();
        $user->meals()->save($meal);
        
        $this->actingAs($user);

        $response = $this->get("/user/{$user->slug}/meals")
            ->assertStatus(200);
    }

    public function test_a_guest_cannot_access_a_users_meals()
    {        
        $user = User::factory()->create();
        $response = $this->get("/user/$user->slug/meals")
            ->assertStatus(302);
    } 

    public function test_a_user_cannot_view_other_users_meals()
    {

        $user = User::factory()->create();
        
        $this->be($user2 = User::factory()->create());
        
        $response = $this->get("/user/$user->slug/meals")
            ->assertStatus(401);
    }

}
