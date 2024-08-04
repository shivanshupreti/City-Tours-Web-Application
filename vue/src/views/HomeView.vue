<template>
  <div class="loading" v-if="isLoading">
      <p>Loading...</p>
  </div>
  <div v-else>
      <header class="flex">
          <h1>City Tours</h1>
      </header>
      <main>
          <div v-for="city in cities" :key="city.name">
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
  text-align: center;
  margin-top: 20px;
  font-family: 'Arial', sans-serif;
}

main {
  display: flex;
  flex-direction: column;
  padding: 8px;
}
</style>