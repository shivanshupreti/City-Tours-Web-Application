<template>
  <div>
    <input 
      ref="searchInput"
      type="text" 
      v-model="searchText" 
      placeholder="Search landmarks..." 
      @input="onSearchInput" 
    />
    
    <table id="tblUsers" v-if="searchText">
      <thead>
        <tr>
          <th>Name</th>
          <th>Venue Type</th>
          <th>City</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr v-if="isLoading">
          <td colspan="4">Loading...</td>
        </tr>
        <tr v-if="!isLoading && filteredList.length === 0">
          <td colspan="4">No results found.</td>
        </tr>
        <tr v-for="(landmark, index) in filteredList" :key="index">
          <td>{{ landmark.name }}</td>
          <td>{{ landmark.venueType }}</td>
          <td>{{ landmark.city }}</td>
          <td>{{ landmark.description }}</td>
        </tr>
      </tbody>
    </table>
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
#tblUsers {
  width: 100%;
  border-collapse: collapse;
}

#tblUsers th, #tblUsers td {
  padding: 8px;
  border: 1px solid #ddd;
}

#tblUsers tr:nth-child(even) {
  background-color: #f2f2f2;
}

input[type="text"] {
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100%;
}
</style>