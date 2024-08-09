<template>
  <div>
    <input 
      ref="searchInput"
      type="text" 
      v-model="searchText" 
      placeholder="Places to go, things to do, search landmarks..." 
      @input="onSearchInput" 
    />
    
    <div v-if="searchText" class="search-results">
      <div v-if="isLoading">
        <p>Loading...</p>
      </div>
      <div v-if="!isLoading && filteredList.length === 0">
        <p>No results found.</p>
      </div>
      <div 
        v-for="(landmark, index) in filteredList" 
        :key="index" 
        @click="navigateToDetail(landmark)" 
        class="search-result-item"
      >
        <span class="landmark-name">{{ landmark.name }}</span>
        <span class="landmark-city">{{ landmark.city }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import LandmarkService from '../services/LandmarkService';

export default {
  data() {
    return {
      landmarks: [],
      searchText: '',
      isLoading: false
    };
  },
  computed: {
    filteredList() {
      const lowerCaseSearchText = this.searchText.toLowerCase();

      return this.landmarks.filter(landmark =>
        (landmark.name && landmark.name.toLowerCase().includes(lowerCaseSearchText)) ||
        (landmark.venueType && landmark.venueType.toLowerCase().includes(lowerCaseSearchText)) ||
        (landmark.city && landmark.city.toLowerCase().includes(lowerCaseSearchText)) ||
        (landmark.description && landmark.description.toLowerCase().includes(lowerCaseSearchText))
      );
    }
  },
  methods: {
    async fetchLandmarks(query) {
      this.isLoading = true;
      try {
        const response = await LandmarkService.getAllLandmarks();
        console.log('API Response:', response.data);
        this.landmarks = response.data;
        if (query) {
          this.searchText = query;
        }
      } catch (error) {
        console.error('Error fetching landmarks:', error);
      } finally {
        this.isLoading = false;
      }
    },
    onSearchInput() {
      if (this.searchText.trim()) {
        this.fetchLandmarks(this.searchText);
      } else {
        this.landmarks = [];
      }
    },
    navigateToDetail(landmark) {
      this.$router.push({ name: 'LandmarkDetailView', params: { id: landmark.id } });
    },
    handleClickOutside(event) {
      const searchInput = this.$refs.searchInput;
      if (searchInput && !searchInput.contains(event.target)) {
        this.searchText = '';
        this.landmarks = [];
      }
    }
  },
  mounted() {
    document.addEventListener('click', this.handleClickOutside);
  },
  beforeUnmount() {
    document.removeEventListener('click', this.handleClickOutside);
  }
};
</script>

<style scoped>
input[type="text"] {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100%;
}

.search-results {
  margin-top: 10px;
}

.search-result-item {
  cursor: pointer;
  padding: 10px;
  border-bottom: 1px solid #ddd;
  transition: background-color 0.3s;
}

.search-result-item:hover {
  background-color: #e0e0e0; 
}

.search-result-item:last-child {
  border-bottom: none; 
}

.landmark-name {
  font-weight: bold;
  color: #333; 
}

.landmark-city {
  color: #777; 
  margin-left: 10px; 
}
</style>