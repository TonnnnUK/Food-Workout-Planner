<template>
    <div class="container">
        <div class="flex flex-wrap justify-around col-md-8">
            <div class="w-2/5 p-2 mb-4 bg-white card " v-for="exercise in exercises" :key="exercise.id">
                <div class="flex flex-row items-center justify-around card-body">
                    <a :href="`/exercises/${exercise.slug}`">
                        {{ exercise.name }}
                    </a>
                    <div class="inline-flex flex-col text-xs">
                        <span>Image <i class="text-green-500 fa fa-check" v-if="exercise.image"></i> <i class="fa fa-times" v-if="!exercise.image"></i> </span>
                        <span>Video <i class="text-green-500 fa fa-check" v-if="exercise.video_url"></i> <i class="fa fa-times" v-if="!exercise.video_url"></i> </span>
                    </div>
                    <button class="px-3 py-2 ml-5 bg-gray-400" v-if="isAdmin" 
                        @click.prevent="$modal.show('exercise-modal', {action: 'Edit', exercise: exercise})">Edit</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        
        data(){
            return {
                exercises: [],
                isAdmin: false
            }
        },

        created() {
            if ( window.user && window.user.role == 'admin' ) {
                this.isAdmin = true
            }
            
            this.fetchExercises()

            Event.$on('exerciseUpdated', () => {
                this.fetchExercises()
                this.$modal.hide('exercise-modal');
  
            })
        },

        methods: {
            fetchExercises() {
                axios.get('/api/exercises')
                    .then(response => (
                        this.exercises = response.data
                ))
            },

            updateList(){
                this.fetchExercises
            }
        }
    }
</script>
