<template>
  <form class="mt-5 flex" @submit="submitForm()">
        <div class="w-1/2">
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Recipe Title" v-model="recipe.title">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Servings" v-model="recipe.servings">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Description" v-model="recipe.description">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Method" v-model="recipe.method">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Link" v-model="recipe.link">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Image" v-model="recipe.image" @blur="addImage()">
            </div>
            <div class="flex items-center">
                <input class="w-3/4 mb-2 p-2" type="text" placeholder="Video" v-model="recipe.video" @blur="addVideo()">
            </div>
            <div class="flex items-center">
                <primary-button text="save"></primary-button>
            </div>
        </div>
        <div class="w-1/2">
            <div v-if="showImage">
                <img :src="recipe.image">
            </div>
            <div class="embed-responsive embed-responsive-16by9" v-if="showVideo">
                <iframe class="embed-responsive-item" :src="recipe.video" allowfullscreen></iframe>
            </div>
        </div>
    </form>
</template>

<script>
export default {

    data(){
        return {
            recipe: {},
            showVideo: false,
            showImage: false,
        }
    },

    methods: {
        addVideo(){
            if ( this.recipe.video != ""){
                this.showVideo = true
            }
        },
        addImage(){
            if ( this.recipe.image != ""){
                this.showImage = true
            }
        },
        submitForm(){

        }
    }

}
</script>
