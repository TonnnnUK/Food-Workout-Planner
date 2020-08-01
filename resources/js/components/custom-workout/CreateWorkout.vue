<template>
    <form class="my-5" v-on:submit.prevent="submitForm()">
        
        
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                placeholder="Workout Title"
                type="text" v-model="workout.name" name="name" required>
        
        
        <vue-editor v-model="workout.notes" />


        <section class="w-full">
            <workout-exercises></workout-exercises>
        </section>
        
        <section class="w-full">
            <manage-workout :workout="workout" :exercises="exercises"></manage-workout>
        </section>
    

        <button class="d-inline-block btn btn-primary my-4 w-1/4">Create</button>
    </form>
</template>

<script>
import { VueEditor } from "vue2-editor";
import exercises from './WorkoutExercises'

export default {

    components: {
        VueEditor ,
        'workout-exercises': exercises
    },

    data(){
        return {
            workout: {
                exercises: []
            },
            exercises: []
        }
    },

    created(){
        Event.$on('addedExercise', (exercise) => {
            this.workout.exercises.push(exercise.id)
            this.exercises.push(exercise)
        })

        Event.$on('routineUpdated', (routine) => {
            this.workout.routine = routine
        })
    },

    methods: {
        submitForm(){
            this.workout.routine = JSON.stringify(this.workout.routine)
            let formData = new FormData

            formData.append('user_id', window.user.id)
            formData.append('user_slug', window.user.slug)

            for ( var key in this.workout ) {
                formData.append(key, this.workout[key]);
            }

            axios.post('/api/custom-workout/create', formData)
                .then(response => {
                        const workout = response.data.workout;
                        window.location.href = '/custom-workout/'+workout.slug
                    }
                )
        }
    }
}
</script>

<style>

</style>