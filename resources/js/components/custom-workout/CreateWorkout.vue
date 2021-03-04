<template>
    <form class="my-5" v-on:submit.prevent="submitForm()">
            
        <div class="flex justify-between">
            
            <div class="w-full lg:w-7/12">
                <section class="w-full">
                    <input class="shadow appearance-none border rounded w-full lg:w-8/12 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                            placeholder="Workout Title"
                            type="text" v-model="workout.name" name="name" required>

                    <workout-exercises></workout-exercises>

                    <manage-workout :workout="workout" :exercises="exercises"></manage-workout>
                </section>
            

                <button class="d-inline-block btn btn-primary my-4 w-1/4">Create</button>
            </div>
            
            <div class="w-full lg:w-4/12">
                <vue-editor v-model="workout.notes" />
            </div>
            
        </div>
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
                notes: 'Workout notes...',
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