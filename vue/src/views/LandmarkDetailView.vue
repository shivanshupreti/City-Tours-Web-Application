<template>
  <div class="container">
    <div class="loading" v-if="isLoading">
      <p>Loading...</p>
    </div>
    <div v-else>
      <landmark-details :landmark="landmark" :availability="availability" />
    </div>
  </div>
  </template>
  
  <script>
  import LandmarkService from '../services/LandmarkService.js';
  import LandmarkDetails from '../components/LandmarkDetails.vue';
  
  export default {
    components: {
      LandmarkDetails
    },
    data() {
      return {
        landmark: {},
        availability: [],
        isLoading: true
      };
    },
    methods: {
      getLandmark(id) {
        Promise.all([
          LandmarkService.getLandmark(id),
          LandmarkService.getAvailability(id)
        ])
        .then(([landmarkResponse, availabilityResponse]) => {
          this.landmark = landmarkResponse.data;
          this.availability = availabilityResponse.data;
          this.isLoading = false;
        })
        .catch(error => {
          this.handleErrorResponse(error);
        });
      },
      handleErrorResponse(error) {
        if (error.response && error.response.status == 404) {
          this.$router.push({ name: 'NotFoundView' });
        } else {
          this.isLoading = false;
          this.$store.commit('SET_NOTIFICATION', 'Could not get landmark data from server.');
        }
      }
    },
    created() {
      const id = this.$route.params.id;
      this.getLandmark(id);
    }
  };
  </script>
  
  <style scoped>
.container {
  background-color:whitesmoke; 
  min-height: 100vh; 
  padding: 16px; 
  border-radius: 15px; 
  }
  .loading {
    text-align: center;
    font-size: 1.5rem;
  }
  </style>
  