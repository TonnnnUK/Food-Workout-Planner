<?php
namespace Database\Seeders;

use App\Models\FoodItem;
use App\Models\FoodType;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class FoodItemsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $meat = [
            'chicken breast',
            'chicken thighs',
            'whole chicken',
            'chicken wings',
            'chicken drumstick',
            'mince beef',
            'diced beef',
            'beef strips',
            'burger',
            'sirloin steak',
            'rump steak',
            'ribeye steak',
            'back bacon',
            'bacon lardons',
            'pork steaks',
            'pork chops',
            'pork belly slices',
            'pork belly',
            'pork joint',
            'pork sausages',
            'cumberland sausage',
            'lincolnshire sausage',
            'pork & red onion sausages',
            'lamb joint',
            'diced lamb',
            'lamb steak',
            'lamb shank',
            'duck breast',
            'aromatic duck',
            'hot dog',
            'gammon',
            'ham',
        ];

        $fish = [
            'salmon',
            'haddock',
            'cod',
            'fish fingers',
            'whitefish',
            'prawns',
            'tuna'
        ];

        $carbs = [
            'potato',
            'jaket potato',
            'baby potato',
            'new potato',
            'long grain white rice',
            'long grain brown rice',
            'basmati rice',
            'basmati brown rice',
            'jasmin rice',
            'pasta - fusilli',
            'pasta - spaghetti',
            'pasta - tagliatelle',
            'egg noodles',
            'rice noodles',
            'sweet potato',
            'white bread',
            'seeded bread',
            'half baked baguette',
            'burger bun',
            'finger bread bun',
            'baguette',
            'flatbread',
            'naan bread',
            'pitta bread',
            'flour tortilla',
        ];
        
        $vegetables = [
            'brocolli',
            'tender stem',
            'sprouting brocolli',
            'carrrots',
            'peas',
            'green beans',
            'stir fry mix',
            'cauliflower',
            'cabbage',
            'courgette',
            'parsnips',
            'asparagus',
            'celery',
            'white onion',
            'red onion',
            'peppers',
            'chillies',
            'ginger',
            'garlic',
            'bok choi',
            'leek',
        ];

        $fruit = [
            'bananas',
            'blueberries',
            'sweet clems',
            'apple',
            'pear',
            'pineapple',
            'green grapes',
            'red grapes',
            'black grapes',
            'melon',
            'lime',
            'lemon',
            'cranberries',
            'mandarin',
            'mango',
        ];

        $salad = [
            'salad tomato',
            'cherry tomato',
            'cucumber',
            'iceberg lettuce',
            'gem lettuce',
            'leaf salad',
            'coleslaw',
            'spring onion',
        ];

        $cupboard = [
            'Baked beans',
            'tinned chopped tomatoes',
            'tinned plum tomatoes',
            'tomato passata',
            'tomato puree',
            'tinned tuna',
            'chicken soup',
            'tomato soup',
            'chickpeas',
            'bolognase - jar sauce',
            'tikka masala - jar sauce',
            'balti - jar sauce',
            'bhuna - jar sauce',
            'green curry - jar sauce',
            'green curry paste',
            'curry paste',
            'angel delight',
            'coconut milk',
            'cocoa powder',
            'plain flour',
            'cornflour',
            '00 flour',
            'eggs',
            'baking powder',
            'gravy granules',
            'peanuts',
            'hazelnuts',
            'ground almonds',
            'breadcrumbs',
            'brown sugar',
            'chocolate - milk',
            'chocolate - dark',
            'oats',
            'crunchy nut',
            'peanut butter - crunchy',
            'peanut butter - smooth',
        ];

        $condiments = [
            'brown sauce',
            'bbq sauce',
            'nancos medium',
            'malt vinegar',
            'chicken oxo',
            'salt',
            'rice wine',
            'apple cider vinegar',
            'sherry vinegar',
            'balsamic vinegar',
            'fish sauce',
            'sesame oil',
            'olive oil',
            'vegetable oil',
            'redpalm & rapeseed oil',
            'honey',
            'hoisin sauce',
            'mango chutney',
            'mayonnaise',
            'sweet chilli sauce',
            'tabasco sauce',
            'sriracha sauce',
            'worcestershire sauce',
        ];

        $spices = [
            'ground cumin',
            'ground coriander',
            'garam masala',
            'paprika',
            'tandoori powder',
            'curry powder',
            'tumeric',
            'cinemmon',
            'cardamom pod',
            'cayenne',
            'Chinese 5 spice',
            'chilli powder',
            'cloves',
            'all spice',
            'cumin seeds',
            'coriander seeds',
            'fennel seeds',
            'ground ginger',
            'garlic granules',
            'nutmeg',
            'sesame seeds',
            'sichaun pepper',
            'star anise',
        ];

        $herbs = [
            'mixed herbs',
            'oregano',
            'basil - dried',
            'basil - fresh',
            'parsley - dried',
            'parsley - fresh',
            'coriander - dried',
            'coriander - fresh',
            'thyme - dried',
            'thyme - fresh',
            'rosemary - dried',
            'rosemary - fresh',
            'marjoram',
            'mint',
            'chives',
            'sage - dried',
            'sage - fresh',
        ];

        $dairy = [
            'greek yoghurt',
            'strawberry yogurt',
            'crunch corner yogurt',
            'cheese - cheddar',
            'cheese - red leicester',
            'cheese - mozarella',
            'milk',
            'butter',
            'buttermilk',
            'double cream',
            'single cream',
            'clotted cream',
            'squirty cream',
            'cream cheese',
            'mascarpone',
        ];

        $drinks = [
            'pepsi max',
            'apple juice',
            'lime juice',
            'orange juice',
            'cordial',
            'cranberry juice',
            'lemonade',
            'flavoured water',
            'red wine',
            'white wine',
            'cider',
            'beer',
            'ginger beer',
        ];

        $types = [
            'meat', 
            'fish', 
            'carbs',
            'vegetables',
            'fruit',
            'salad',
            'cupboard',
            'condiments',
            'spices',
            'herbs',
            'dairy',
        ];

        foreach ( $types as $type ){
            $type = FoodType::create([
                'name' => $type,
                'slug' => Str::slug($type)    
            ]);
        }     

        foreach ( $meat as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 1;
            $food->save();
        }

        foreach ( $fish as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 2;
            $food->save();
        }
    
        foreach ( $carbs as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 3;
            $food->save();
        }


        foreach ( $vegetables as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 4;
            $food->save();
        }


        foreach ( $fruit as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 5;
            $food->save();
        }

        foreach ( $salad as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 6;
            $food->save();
        }

        foreach ( $cupboard as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 7;
            $food->save();
        }

        foreach ( $condiments as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 8;
            $food->save();
        }
        foreach ( $spices as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 9;
            $food->save();
        }

        foreach ( $herbs as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 10;
            $food->save();
        }

        foreach ( $dairy as $item ){
            $food = new FoodItem;
            $food->name = $item;
            $food->slug = Str::slug($item);
            $food->food_type_id = 11;
            $food->save();
        }
    }
}
