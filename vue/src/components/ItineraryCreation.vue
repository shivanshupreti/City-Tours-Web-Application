<template>
    <div class="container">
        <h2>Create Itinerary</h2>
        <form @submit.prevent="handleSubmit">
            <div class="form-group">
                <label for="name">Itinerary Name:</label>
                <input type="text" id="name" v-model="itinerary.name" required />
            </div>
            <div class="form-group">
                <label for="startingPoint">Starting Point:</label>
                <input type="text" id="startingPoint" v-model="itinerary.startingPoint" required />
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
            <div class="form-group">
                <label for="city">City:</label>
                <select id="city" v-model="itinerary.city" @change="fetchLandmarks" required>
                    <option value="Paris">Paris</option>
                    <option value="Rome">Rome</option>
                    <option value="Kyoto">Kyoto</option>
                    <option value="New York City">New York City</option>
                    <option value="Sydney">Sydney</option>
                </select>
            </div>
            <div class="form-group" v-if="availableLandmarks.length > 0">
                <h3>{{ itinerary.city }}</h3>
                <div class="landmark-list">
                    <SmallLandmarkCard
                        v-for="landmark in availableLandmarks"
                        :key="landmark.id"
                        :landmark="landmark"
                        @update-landmark-status="toggleLandmark"
                    />
                </div>
            </div>
            <br><br>
            <div class="form-group button-group">
                <button class="create-btn" type="submit" @click="handleCreate">Save</button>
                <button class="delete-btn" type="button" @click="handleDelete">Delete</button>
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
      availableLandmarks: []
    };
  },
  methods: {
    async fetchLandmarks() {
      try {
        const response = await LandmarkService.listByCity(this.itinerary.city);
        this.availableLandmarks = response.data;
      } catch (error) {
        console.error('Error fetching landmarks:', error);
        alert('There was an error fetching the landmarks. Please try again.');
      }
    },
    async handleCreate() {
      try {
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
    }
  },
  created() {
    this.fetchLandmarks();
  }
};
</script>

<style scoped>
.container {
    max-width: 600px;
    margin: 50px auto;
    background: #ececec;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding-left: 50px;
    padding-right: 50px;
}

h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
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
    padding: 12px;
    width: calc(33% - 10px);
    font-size: 1rem; 
    border-radius: 5px; 
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
