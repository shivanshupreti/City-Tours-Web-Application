<template>
    <h2>{{ city }}</h2>
    <div class="landmark-list">
      <landmark-card v-for="landmark in landmarks" :key="landmark.id" :landmark="landmark" />
    </div>
  </template>
  
  <script>
  import LandmarkCard from './LandmarkCard.vue';
  import LandmarkService from '../services/LandmarkService.js';
  
  export default {
    components: {
      LandmarkCard
    },
    props: {
      city: {
        type: String,
        required: true
      }
    },
    data() {
      return {
        landmarks: []
      };
    },
    methods: {
      async fetchLandmarks() {
        try {
          const response = await LandmarkService.list(this.city);
          this.landmarks = response.data;
        } catch (error) {
          this.handleErrorResponse();
        }
      },
      handleErrorResponse() {
        this.$store.commit('SET_NOTIFICATION', `Could not get landmarks for ${this.city}.`);
      }
    },
    created() {
      this.fetchLandmarks();
    }
  }
  </script>
  
  <style scoped>
  .landmark-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
  }
  </style>
  