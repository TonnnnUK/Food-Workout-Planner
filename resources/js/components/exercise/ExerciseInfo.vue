<template>
    <div>
       <h1 class="text-2xl text-center">{{ info.name }}</h1>

        {{ info.description }}
        
        <img v-if="info.image != ''" :src="info.image">
        
        <img v-if="info.video_url != ''" :src="info.video_url">


        <button class="p-2 bg-gray-500" 
            @click.prevent="$modal.show('exercise-modal', {action: 'Edit', exercise: info})">
                Edit Exercise
        </button>
    </div>
</template>

<script>
export default {

    props: ['exercise'],

    data(){
        return {
            info: {}
        }
    },

    created() {
            
        Event.$on('exerciseUpdated', () => {
            this.fetchExerciseData()
            this.$modal.hide('exercise-modal');
        })

        this.info = this.exercise
    },

    methods: {
        fetchExerciseData() {
            axios.get(`/api/exercises/${this.info.slug}`)
                .then(response => (
                    this.info = response.data
            ))
        },
    }

}
</script>
