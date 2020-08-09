<template>
  <div class="my-5 flex flex-row">
    <div class="flex-1">
      <input type="text" placeholder="Search to add exercises" 
              class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-5" 
              v-model="search" 
              v-on:keyup="onSearch()"
              ref="search-btn">
      <div v-if="searching">
        <div class="mb-2 inline-block mx-1" v-for="(exercise, key) in searchResults" :key="exercise.id">            
          <button type="button" class="d-inline-block bg-blue-800 px-2 text-white" @click="addExercise(exercise, key)">{{ exercise.name }} +</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {

    data(){
      return {
        searching: false,
        search: '',
        exerciseList: [],
        exercises: [],
        
      }
    },
    
    
    created(){
      this.fetchExercises()
    },

    methods: {
      fetchExercises() {
          axios.get('/api/exercises')
              .then(response => (
                  this.exerciseList = response.data
          ))
      },
      onSearch() {
         if (this.search.length > 0 ){
          this.searching = true
        } else {
          this.searching = false
        }
      },

      addExercise(exercise, key){
        this.exercises.push(exercise)
        this.searchResults.splice(key, 1)
        this.search = ''
        this.searchResults = ''
        this.searching = false
        Event.$emit('addedExercise', exercise)
      }
    },

    computed: {
      searchResults: { 
        get: function (){
          let search = this.exerciseList
          search = search.filter(ex => {
            return ex.name.toLowerCase().indexOf(this.search.toLowerCase()) > -1
          });
          
          return search;
        },

        set: function(value){
          return value;
        }
      }
    }

}
</script>