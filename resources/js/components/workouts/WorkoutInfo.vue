<template>
    <div>
       <h1 class="text-2xl text-center">{{ info.name }}</h1>

        {{ info.description }}


        <button class="bg-gray-500 p-2" 
            @click.prevent="$modal.show('workout-modal', {action: 'Edit', workout: info})">
                Edit Workout
        </button>
    </div>
</template>

<script>
export default {

    props: ['workout'],

    data(){
        return {
            info: {}
        }
    },

    created() {
            
        Event.$on('workoutUpdated', () => {
            this.fetchWorkoutData()
            this.$modal.hide('workout-modal');
        })

        this.info = this.workout
    },

    methods: {
            fetchWorkoutData() {
                axios.get(`/api/workouts/${this.info.slug}`)
                    .then(response => (
                        this.info = response.data
                ))
            },
    }

}
</script>
