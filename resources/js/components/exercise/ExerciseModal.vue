<template>
    <modal name="exercise-modal" @before-open="beforeOpen" :height="`auto`">
        <div class="p-10">
            <h2 class="mb-5 text-xl text-center">{{action}} Exercise</h2>
            <form  v-on:submit.prevent="submitForm()">
                <input class="w-full px-3 py-2 mb-5" v-if="exercise.id" :value="`ID: ${exercise.id}`" disabled />
                <label for="">Name</label>
                <input class="w-full px-3 py-2 mb-5 leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline" 
                        type="text" v-model="exercise.name" name="name">
                <label for="">Slug</label>
                <input class="w-full px-3 py-2 mb-5 leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline" 
                        type="text" v-model="exercise.slug" name="slug">
                <label for="">Description</label>
                <textarea class="w-full px-3 py-2 leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                         v-model="exercise.description" rows="10"></textarea>

                <label for="">Image</label>
                <input class="w-full px-3 py-2 mb-5 leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline" 
                        type="text" v-model="exercise.image" name="image">
                <label for="">Video</label>
                <input class="w-full px-3 py-2 mb-5 leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline" 
                        type="text" v-model="exercise.video_url" name="video_url">
                        
                <button class="px-5 py-2 mt-5 bg-gray-500"><span v-text="action === 'Edit' ? 'Update' : action"></span></button>
            </form>
        </div>
    </modal>
</template>

<script>

export default {

    data() {
        return {
            exercise: {
                id: '',
                name: '',
                slug: '',
                description: '',
                image: '',
                video_url: '',
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
                this.exercise.image = event.params.exercise.image
                this.exercise.video_url = event.params.exercise.video_url
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