<template>
  <div class="loading" v-if="isLoading">
      <p>Loading...</p>
  </div>
  <div v-else>
      <header class="flex">
        <img src="images\city_tour.gif" alt="City Tours Icon" class="header-icon" />
          <h1>City Tours</h1>
      </header>
      <main class="main-content">
          <div v-for="city in cities" :key="city.name" class="landmark-list-wrapper">
              <landmark-list :city="city.name" />
          </div>
      </main>
  </div>
</template>

<script>
import LandmarkService from '../services/LandmarkService.js';
import LandmarkList from '../components/LandmarkList.vue';

export default {
  components: {
      LandmarkList
  },
  data() {
      return {
          cities: [
              { name: 'Paris' },
              { name: 'Rome' },
              { name: 'Kyoto' },
              { name: 'New York City' },
              { name: 'Sydney' }
          ],
          isLoading: true
      };
  },
  methods: {
      async fetchLandmarks(city) {
          try {
              const response = await LandmarkService.list(city);
              this.$set(this.landmarks, city, response.data);
          } catch (error) {
              this.handleErrorResponse();
          } finally {
              this.isLoading = false;
          }
      },
      handleErrorResponse() {
          this.isLoading = false;
          this.$store.commit('SET_NOTIFICATION', `Could not get landmark data from server.`);
      }
  },
  created() {
      this.cities.forEach(city => this.fetchLandmarks(city.name));
  }
}
</script>

<style scoped>
.flex {
  display: flex;
  align-items: center;  
  justify-content: center;  
  margin-top: 20px;
  font-family:'Courier New', Courier, monospace;
  height: 20vh;  
  position: relative;  
  margin-left: -120px;  
}

.header-icon {
  width: 140px; 
  height: auto;
  margin-right: 0px; 
}

h1 {
  margin: 0; 
}

.main-content {
  background-color:white; 
  padding: 16px; 
}

.landmark-list-wrapper {
  background-color:whitesmoke; 
  padding: 10px;
  border-radius: 8px;
  margin-bottom: 16px;
  font-size: 1em; 
  box-shadow: 0 0 10px rgba(133, 133, 133, 0.1); 
}

main {
  display: flex;
  flex-direction: column;
  padding: 8px;
}
</style>