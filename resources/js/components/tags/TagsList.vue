<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Tags List Component</div>

                    <div class="card-body">
                        <tag-item v-for="item in tags" 
                            :tag="item" 
                            :key="item.id">
                        </tag-item>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
        
        data(){
            return {
                tags: []
            }
        },

        mounted () {
            axios.get('/api/tags')
            .then(response => (
                this.tags = response.data
            ))
        }
    }
</script>
