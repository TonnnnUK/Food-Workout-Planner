<template>

    <section>
        <h2>Meal info Component</h2>
        
        <ul>
            <li v-for="ingredient in ingredients" :key="ingredient.id">
                {{ingredient.name}} - {{ingredient.qty}} 
            </li>
        </ul>
    </section>

</template>

<script>
export default {

    props: ['meal', 'ingredients']
}
</script>
