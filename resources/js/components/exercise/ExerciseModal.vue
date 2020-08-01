<template>
    <modal name="exercise-modal" @before-open="beforeOpen" :height="`auto`">
        <div class="p-10">
            <h2 class="text-xl mb-5 text-center">{{action}} Exercise</h2>
            <form  v-on:submit.prevent="submitForm()">
                <input class="w-full py-2 px-3 mb-5" v-if="exercise.id" :value="`ID: ${exercise.id}`" disabled />
                <label for="">Name</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                        type="text" v-model="exercise.name" name="name">
                <label for="">Slug</label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
                        type="text" v-model="exercise.slug" name="slug">
                <label for="">Description</label>
                <textarea class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                         v-model="exercise.description" rows="10"></textarea>

                <button class="bg-gray-500 px-5 py-2 mt-5"><span v-text="action === 'Edit' ? 'Update' : action"></span></button>
            </form>
        </div>
    </modal>
</template>

<script>

export default {

    data() {
        return {
            exercise: {
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

            this.exercise = {}

            if (event.params.exercise){
                this.exercise.id = event.params.exercise.id
                this.exercise.name = event.params.exercise.name
                this.exercise.slug = event.params.exercise.slug
                this.exercise.description = event.params.exercise.description
            }

            this.action = event.params.action
            if ( this.action == 'Edit' ) {
                this.endpoint = `/api/exercise/${this.exercise.id}/update` 
            }

            if ( this.action == 'Create') {
                this.endpoint = `/api/exercise/create`
            }
        },

        submitForm(){            
            let formData = new FormData

            for ( var key in this.exercise ) {
                formData.append(key, this.exercise[key]);
            }


            axios.post(`${this.endpoint}`, formData)
                    .then(response => {
                        this.exercise = {}
                        Event.$emit('exerciseUpdated')
                    }
                )    
        }
    }
}
</script>