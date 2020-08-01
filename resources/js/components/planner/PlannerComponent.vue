<template>
  <div>

      <h2>Planner Component</h2>

  </div>
</template>

<script>
export default {

    data(){
        return {

        }
    },

    created: function(){
        if (window.user) {

            console.log('user is logged in');
            

        } else {
            console.log('not logged in')
            window.location.href = '/403'
            
        }
    },

}
</script>

<style>

</style>