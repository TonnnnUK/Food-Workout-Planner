<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Equipment List Component</div>

                    <div class="card-body">
                        <equipment-item v-for="item in equipmentItems" 
                            :equipment="item" 
                            :key="item.id">
                        </equipment-item>
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
                equipmentItems: []
            }
        },

        mounted () {
            axios.get('/api/equipment')
            .then(response => {
                this.equipmentItems = response.data
            })
        }
    }
</script>
