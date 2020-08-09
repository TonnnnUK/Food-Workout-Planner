<template>
    <modal name="muscle-modal" @before-open="beforeOpen" >
        <div class="p-10">
            <h2 class="text-xl mb-5 text-center">{{action}} {{ muscle }}</h2>
            <form action="">
                <input type="text" v-model="muscle" name="name">
                <input type="text" v-model="slug" name="slug">
                <textarea v-model="description"></textarea>
            </form>
        </div>
    </modal>
</template>

<script>
export default {

    data() {
        return {
            action: 'Create muscle',
            muscle: null,
            slug: null,
            description: null,
            image: null,
            second_image: null,
            third_image: null,
        }
    },

    methods: {
        beforeOpen (event) {
            this.action = event.params.action
            if (event.params.muscle){
                this.muscle = event.params.muscle.name
                this.slug= event.params.muscle.slug
                this.description = event.params.muscle.description
                this.image = event.params.muscle.image
                this.second_image = event.params.muscle.second_image
                this.third_image = event.params.muscle.third_image
            }
        }
    }

}
</script>