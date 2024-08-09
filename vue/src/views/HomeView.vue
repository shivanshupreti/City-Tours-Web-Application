<template>
  <div class="loading" v-if="isLoading">
      <p>Loading...</p>
  </div>
  <div v-else>
      <header class="header">
        <img src="images\city_tour.gif" alt="City Tours Icon" class="header-icon" />
          <h1>City Tours</h1>
          <SearchBox v-model="searchCriteria" @search="performSearch" class="SearchBox"
        />
      </header>
      <main class="main-content">
          <div v-for="city in cities" :key="city.name" class="landmark-list-wrapper">
              <landmark-list :city="city.name" />
          </div>
      </main>
  </div>
</template>

<script>
import LandmarkService from '../services/LandmarkService';
import LandmarkList from '../components/LandmarkList.vue';
import SearchBox from '../components/SearchBox.vue';


export default {
  components: {
      LandmarkList,
      SearchBox
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
          isLoading: true,
          landmarks: {},
          searchCriteria: ''
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
    },
    performSearch(searchCriteria) {
      console.log('Search for:', searchCriteria);
    }
    },
    created() {
      this.cities.forEach(city => this.fetchLandmarks(city.name));
    }
};
</script>

<style scoped>
.header {
  display: flex;
  align-items: center;
  gap: 20px;
  padding: 20px;
  justify-content: center;
}

.header-icon {
  width: 140px;
  height: auto;
}

h1 {
  margin: 0;
  font-size: 2em;
  font-family: 'Courier New', Courier, monospace;
}

.dropdown {
  margin-left: 20px;
}

.main-content {
  background-color: white;
  padding: 16px;
}

.landmark-list-wrapper {
  background-color: whitesmoke;
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