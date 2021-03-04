<template>
  <div class="flex flex-col" v-if="exercises.length > 0">
        <div class="w-full">
            <page-subtitle class="my-5">Routine</page-subtitle>
        </div>

        <section class="flex flex-col">
            <div class="flex flex-col w-full lg:w-8/12 mb-3">
                <emphasis-title v-if="routine.length < 1">Select an exercise to add sets</emphasis-title>
                <div v-for="item in routine" :key="item.number"
                    class="excercise-card w-full mb-5 p-0"
                >
                    <div class="flex justify-between items-center p-3" 
                        :class="item.complete ? 'bg-green-500' : ''"
                        v-if="item.type == 'exercise'">
                        <button class="mr-3 text-red-800" @click="removeSet(routine)"><i class="fas fa-times"></i></button>
                        <label class="w-full lg:w-7/12" for="">{{item.exercise.name}}</label>
                        
                        <div>
                            <label for="">
                                weight: <input type="text" class="bg-gray-200 w-1/4 text-center" v-model="item.weight">
                            </label>
                            <select class="w-10" name="metric" v-model="item.metric">
                                <option value="kg">kg</option>
                                <option value="bodyweight">bodyweight</option>
                            </select>
                        </div>
                        
                        <label for="">
                            reps: <input type="text" class="bg-gray-200 w-1/4 text-center" v-model="item.reps">
                        </label>

                        <input type="checkbox" :name="`${item.number}-done`" v-model="item.complete">
                    </div>

                    <div class="p-3 bg-gray-500" v-if="item.type == 'rest'">
                        <button class="mr-3 text-red-800" @click="removeSet(routine)"><i class="fas fa-times"></i></button>
                        <label for="" class="text-white">Rest for {{item.time}} seconds</label>
                    </div>
                </div>

            </div>
            <div class="w-full flex">
                <div class="w-auto d-block mb-2 mr-2" v-for="exercise in exercises" :key="exercise.id">
                    <button class="d-inline-block bg-blue-800 p-2 text-white" 
                            type="button"
                            @click="addExercise(exercise)">
                                <i class="fas fa-plus"></i> {{ exercise.name }}
                    </button> 
                </div>
            </div>
            <div class="flex w-full items-end mb-2">
                <button class="bg-orange-500 p-2 text-white" 
                        @click="addRest()"
                        type="button"><i class="fas fa-head-side-cough"></i> Add Rest</button> 
                
                <input type="text" v-model="restTime" value="30" class="w-20 p-2 mr-2"> 
                <span>Seconds</span>
            </div>
        </section>     
  </div>
</template>

<script>
export default {

    props: ['workout', 'exercises'],

    data(){
        return {
            itemCount: 0,
            exerciseList: {},
            restTime: 30,
            routine: []
        }
    },

    created(){
        this.fetchExercises()

        if ( this.workout.routine) {
            console.log('not undefined');
            this.routine = JSON.parse( this.workout.routine );
            
        }

    },

    methods: {
        fetchExercises() {
          axios.get('/api/exercises')
              .then(response => {
                  this.exerciseList = response.data
                    
            })
        },

        addExercise(exercise){
            console.log('adding to routine');
            this.itemCount += 1
            const insert = {}
            insert.type = 'exercise'
            insert.number = this.itemCount
            insert.exercise = exercise
            insert.weight = 0
            insert.metric = 'kg'
            insert.reps = 10    
            insert.complete = false    
            this.routine.push(insert)
            Event.$emit('routineUpdated', this.routine)
        },

        addRest(){
            console.log('adding rest');
            this.itemCount += 1
            const insert = {}
            insert.type = 'rest'
            insert.time = this.restTime
            this.routine.push(insert)
        },

        removeSet(item){
            this.routine.splice(this.routine.indexOf(item), 1)
        },
        
        saveWorkout(){
            this.workout.routine = JSON.stringify(this.routine)
            let formData = new FormData

            for ( var key in this.workout ) {
                formData.append(key, this.workout[key]);
            }

            axios.post('/api/custom-workout/'+this.workout.id+'/update', formData, this.routine)
                .then(response => {
                    console.log('custom workout updated', response);
                    
                }
            )    
            
        }
    }

}
</script>