<template>
    <transition name="fade">
    <div v-if="show" class="toast bg-orange-100 border-l-4 border-orange-500 text-orange-700 p-4" role="alert">
        <p class="font-bold"></p>
        <p>{{ message }}</p>
    </div>
    </transition>
</template>

<script>
export default {

    props: ['message'],

    data(){
        return {
            show: false
        }
    },

    created(){
        setTimeout(() => this.show = true, 1000);
        setTimeout(() => this.show = false, 8000);
    } 

}
</script>

<style scoped>
    .toast {
        position: absolute;
        top: 5%;
        right: 1%;
    }
    .fade-enter-active, .fade-leave-active {
        transition: opacity .5s;
    }
    .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
        opacity: 0;
    }
</style>
