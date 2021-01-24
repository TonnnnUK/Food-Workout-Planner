<div>
    @foreach($recipes as $recipe)
        <a href="/user/{{Auth::user()->slug}}/meals/{{$recipe->id}}">{{$recipe->name}}</a><br>
    @endforeach

</div>
