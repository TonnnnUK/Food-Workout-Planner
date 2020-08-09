<template>
    <modal name="workout-modal" @before-open="beforeOpen" :height="`auto`">
        <div class="p-10">
            <h2 class="text-xl mb-5 text-center">{{action}} Workout</h2>
            <form  v-on:submit.prevent="submitForm()">
                <input class="w-full py-2 px-3 mb-5" v-if="workout.id" :value="`ID: ${workout.id}`" disabled />
                <label for="">Name</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                        type="text" v-model="workout.name" name="name">
                <label for="">Slug</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                        type="text" v-model="workout.slug" name="slug">
                <label for="">Description</label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                         v-model="workout.description" rows="10"></textarea>

                <button class="bg-gray-500 px-5 py-2 mt-5"><span v-text="action === 'Edit' ? 'Update' : action"></span></button>
            </form>
        </div>
    </modal>
</template>

<script>

export default {

    data() {
        return {
            workout: {
                id: null,
                name: null,
                slug: null,
                description: null,
                image: null,
            },
            endpoint: null,
            action: 'Create',
        }
    },

    methods: {
        beforeOpen (event) {

            this.workout = {}

            if (event.params.workout){
                this.workout.id = event.params.workout.id
                this.workout.name = event.params.workout.name
                this.workout.slug = event.params.workout.slug
                this.workout.description = event.params.workout.description
            }

            this.action = event.params.action
            if ( this.action == 'Edit' ) {
                this.endpoint = `/api/workout/${this.workout.id}/update` 
            }

            if ( this.action == 'Create') {
                this.endpoint = `/api/workout/create`
            }
        },

        submitForm(){            
            let formData = new FormData

            for ( var key in this.workout ) {
                formData.append(key, this.workout[key]);
            }


            axios.post(`${this.endpoint}`, formData)
                    .then(response => {
                        this.workout = {}
                        Event.$emit('workoutUpdated')
                    }
                )    
                
            
        }
    }

}
</script>