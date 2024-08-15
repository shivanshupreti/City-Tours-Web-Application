<template>
  <div class="container">
    <h2>Create Itinerary</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="name">Itinerary Name:</label>
        <input type="text" id="name" v-model="itinerary.name" required />
      </div>
      <div class="form-group">
        <label for="city">City:</label>
        <select id="city" v-model="itinerary.city" @change="fetchLandmarksAndStartingPoints" required>
          <option value="Paris">Paris</option>
          <option value="Rome">Rome</option>
          <option value="Kyoto">Kyoto</option>
          <option value="New York City">New York City</option>
          <option value="Sydney">Sydney</option>
        </select>
      </div>
      <div class="form-group">
        <label for="startingPoint">Starting Point:</label>
        <select id="startingPoint" v-model="itinerary.startingPoint" required>
          <option v-for="startingPoint in availableStartingPoints" :key="startingPoint.id" :value="startingPoint.startingPointName">
            {{ startingPoint.startingPointName }}
          </option>
        </select>
      </div>
      <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" v-model="itinerary.date" required />
      </div>
      <div class="form-group">
        <label for="shared">Shared:</label>
        <select id="shared" v-model="itinerary.shared" required>
          <option value="true">Yes</option>
          <option value="false">No</option>
        </select>
      </div>
      <div class="form-group" v-if="availableLandmarks.length > 0">
        <h3>{{ itinerary.city }}</h3>
        <div class="landmark-list">
          <SmallLandmarkCard v-for="landmark in availableLandmarks" :key="landmark.id" :landmark="landmark"
            @update-landmark-status="toggleLandmark" />
        </div>
      </div>
      <br><br>
      <div class="form-group button-group">
        <button class="create-btn" type="submit" @click="handleCreate">Create</button>
        <button class="cancel-btn" type="button" @click="handleCancel">Cancel</button>
      </div>
    </form>
  </div>
</template>

<script>
import ItineraryService from '../services/ItineraryService';
import LandmarkService from '../services/LandmarkService';
import SmallLandmarkCard from '../components/SmallLandmarkCard.vue';

export default {
  components: {
    SmallLandmarkCard
  },
  data() {
    return {
      itinerary: {
        userId: this.$store.state.user.id,
        name: '',
        startingPoint: '',
        date: '',
        shared: false,
        city: 'Paris',
        landmarkList: []
      },
      availableLandmarks: [],
      availableStartingPoints: [] // State to hold available starting points
    };
  },
  methods: {
    async fetchLandmarksAndStartingPoints() {
      try {
        const [landmarksResponse, startingPointsResponse] = await Promise.all([
          LandmarkService.listByCity(this.itinerary.city),
          ItineraryService.getStartingPointsByCity(this.itinerary.city)
        ]);
        this.availableLandmarks = landmarksResponse.data;
        this.availableStartingPoints = startingPointsResponse.data;
      } catch (error) {
        console.error('Error fetching landmarks or starting points:', error);
        alert('There was an error fetching the landmarks or starting points. Please try again.');
      }
    },
    async handleCreate() {
      try {
        console.log(this.itinerary);
        this.itinerary.shared = this.itinerary.shared === 'true';
        await ItineraryService.createItinerary(this.itinerary);
        window.scrollTo(0, 0);
        this.$router.push({ path: '/itineraries/yourItineraries' });
      } catch (error) {
        console.error('Error creating itinerary:', error);
        alert('There was an error creating the itinerary. Please try again.');
      }
    },
    toggleLandmark({ landmark, isAdded }) {
      const index = this.itinerary.landmarkList.findIndex(l => l.id === landmark.id);
      if (isAdded) {
        if (index === -1) {
          this.itinerary.landmarkList.push(landmark);
        }
      } else {
        if (index !== -1) {
          this.itinerary.landmarkList.splice(index, 1);
        }
      }
    },
    async handleCancel() {
      // Reset the form
      this.itinerary = {
        userId: this.$store.state.user.id,
        name: '',
        startingPoint: '',
        date: '',
        shared: false,
        city: '',
        landmarkList: [],
      };
      const cities = ['Paris', 'Rome', 'Kyoto', 'New York City', 'Sydney'];
      let newCity;
      do {
        newCity = cities[Math.floor(Math.random() * cities.length)];
      } while (newCity === this.itinerary.city)
      this.itinerary.city = newCity;
      await this.fetchLandmarksAndStartingPoints();
      window.scrollTo(0, 0);
    }
  },
  created() {
    this.fetchLandmarksAndStartingPoints();
  }
};
</script>


<style scoped>
.container {
  max-width: 600px;
  margin: 50px auto;
  background: #ececec;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  padding-left: 50px;
  padding-right: 50px;
  border-radius: 8px;
}

h2 {
  text-align: center;
  font-family: 'Courier New', Courier, monospace;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  font-weight: bold;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 12px;
  border-radius: 8px; /* Rounded corners for input fields */
  border: 1px solid #ccc;
  box-sizing: border-box;
  font-size: 1rem;
  transition: border-color 0.3s, box-shadow 0.3s;
}

.form-group input:focus,
.form-group select:focus {
  border-color: #4CAF50;
  box-shadow: 0 0 5px rgba(76, 175, 80, 0.3); /* Subtle shadow on focus */
  outline: none;
}

.landmark-list {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.button-group {
  display: flex;
  gap: 10px;
  justify-content: center;
}

.button-group button {
  color: white;
  border: none;
  cursor: pointer;
  padding: 12px 20px;
  border-radius: 8px; /* Rounded corners for buttons */
  font-size: 1rem;
  transition: background-color 0.3s, transform 0.3s;
}

.button-group .create-btn {
  background-color: #4CAF50;
}

.button-group .edit-btn:hover {
  background-color: #1976D2;
}

.button-group .delete-btn {
  background-color: #f44336;
}

.button-group .delete-btn:hover {
  background-color: #d32f2f;
}

.button-group .cancel-btn {
  background-color: #2196F3;
}

.button-group .cancel-btn:hover {
  background-color: #1976D2;
}
</style>
