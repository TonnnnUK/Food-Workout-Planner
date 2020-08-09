<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div v-for="exercise in exercises" :key="exercise.id">
                            <a :href="`/exercises/${exercise.slug}`">
                                {{ exercise.name }}
                            </a>
                            <button v-if="isAdmin" 
                                @click.prevent="$modal.show('exercise-modal', {action: 'Edit', exercise: exercise})">Edit</button>
                        </div>
                    </div>
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
