<template>
    <add-review v-bind:landmarkId=landmarkId />
  </template>
  
  <script>
  import AddReview from '../components/AddReview.vue';
  
  export default {
    components: {
      AddReview
    },
    computed: {
      landmarkId() {
        return Number(this.$route.params.id);
      }
    }
  };
  </script>
  
  <style></style>