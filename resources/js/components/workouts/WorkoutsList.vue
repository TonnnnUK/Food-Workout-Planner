<template>
    <div class="container">  
        <div class="row justify-content-center" :class="fade">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div v-for="workout in workouts" :key="workout.id">
                            <a :href="`/workout/${workout.slug}`">
                                {{ workout.name }}
                            </a>
                            <button v-if="isAdmin" 
                                @click.prevent="$modal.show('workout-modal', {action: 'Edit', workout: workout})">Edit</button>
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
                workouts: [],
                isAdmin: false,
                fade: ''
            }
        },

        created() {
            if ( window.user && window.user.role == 'admin' ) {
                this.isAdmin = true
            }
            
            this.fetchWorkouts()

            Event.$on('workoutUpdated', () => {
                this.fade = 'animate__animated animate__flash'
                this.fetchWorkouts()
                this.$modal.hide('workout-modal');
  
            })
        },

        methods: {
            fetchWorkouts() {
                axios.get('/api/workouts')
                    .then(response => (
                        this.workouts = response.data
                ))
            },

            updateList(){
                this.fetchWorkouts
            }
        }
    }
</script>
