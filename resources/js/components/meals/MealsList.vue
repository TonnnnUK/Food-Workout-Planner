<template>
  <section>

        <ul>
            <li v-for="meal in meals" :key="meal.id">
                <a :href="`/user/meals/${meal.id}`">{{meal.name}}</a>
            </li>
        </ul>

  </section>
</template>

<script>
export default {

    props: ['meals']

}
</script>