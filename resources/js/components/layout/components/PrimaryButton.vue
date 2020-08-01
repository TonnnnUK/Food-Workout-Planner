<template>
  <button class="btn btn-primary">
      {{ text }}
  </button>
</template>

<script>
export default {
    props: [
        'text',
        'type',
        'link',
        'classes'
    ]
}
</script>

<style>

</style>