<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div v-for="muscle in muscles" :key="muscle.id" :isAdmin="isAdmin">
                            {{muscle.name}}

                            <button v-if="isAdmin" 
                                    @click.prevent="$modal.show('muscle-modal', {action: 'edit', muscle: muscle})">
                                Edit
                            </button>
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
                muscles: [],
                isAdmin: false,
            }
        },

        created () {
            axios.get('/api/muscles')
            .then(response => {
                this.muscles = response.data
            })

            if (window.user.role == 'admin') {
                this.isAdmin = true
                
            }
        },
    }
</script>
