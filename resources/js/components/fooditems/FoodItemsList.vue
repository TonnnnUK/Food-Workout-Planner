<template>
    <div class="container mx-auto">
        <div v-for="item in foodItems" :key="item.id">
            {{item.name}}
        </div>
    </div>
</template>

<script>
export default {

    name: 'food-items-list',

    
    data(){
            return {
                foodItems: [],
                isAdmin: false
            }
        },

    created() {
        if ( window.user && window.user.role == 'admin' ) {
            this.isAdmin = true
        }
        
        this.fetchFoodItems()

    },

    methods: {
        fetchFoodItems(){
            axios.get('/api/ingredients')
                .then(response => (
                    this.foodItems = response.data
            ))
        }
    }
}
</script>
