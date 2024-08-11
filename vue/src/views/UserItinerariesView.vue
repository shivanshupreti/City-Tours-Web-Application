<template>
  <div class="itinerary-list">
    <h2>My Itineraries</h2>
    <table class="itinerary-table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Starting Point</th>
          <th>Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="itinerary in itineraries" :key="itinerary.id">
          <td>{{ itinerary.name }}</td>
          <td>{{ itinerary.startingPoint }}</td>
          <td>{{ itinerary.date }}</td>
          <td>
            <div class="action-buttons">
              <button @click="updateItinerary(itinerary)" class="edit-btn">Edit</button>
              <button @click="deleteItinerary(itinerary.id)" class="delete-btn">Delete</button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Edit Itinerary Form -->
    <div v-if="selectedItinerary" class="edit-form">
      <h3>Edit Itinerary</h3>
      <form @submit.prevent="submitForm">
        <div>
          <label for="name">Name:</label>
          <input type="text" v-model="selectedItinerary.name" required />
        </div>
        <div>
          <label for="startingPoint">Starting Point:</label>
          <input type="text" v-model="selectedItinerary.startingPoint" required />
        </div>
        <div>
          <label for="date">Date:</label>
          <input type="date" v-model="selectedItinerary.date" required />
        </div>
        <div>
          <label for="shared">Shared:</label>
          <select v-model="selectedItinerary.shared" required>
            <option :value="true">Yes</option>
            <option :value="false">No</option>
          </select>
        </div>
        <div class="form-group">
          <label for="city">City:</label>
          <select id="city" v-model="selectedCity" @change="fetchLandmarks" required>
            <option value="Paris">Paris</option>
            <option value="Rome">Rome</option>
            <option value="Kyoto">Kyoto</option>
            <option value="New York City">New York City</option>
            <option value="Sydney">Sydney</option>
          </select>
        </div>
        <div class="form-group" v-if="availableLandmarks.length > 0">
          <h4>{{ selectedCity }} Landmarks</h4>
          <div class="landmark-list">
            <SmallLandmarkCard v-for="landmark in availableLandmarks" :key="landmark.id" :landmark="landmark"
              :is-added="isLandmarkAdded(landmark)" @update-landmark-status="toggleLandmark" />
          </div>
        </div>
        <button type="submit">Save Changes</button>
        <button type="button" @click="cancelEdit">Cancel</button>
      </form>
    </div>
  </div>
</template>

<script>
import itineraryService from "@/services/ItineraryService";
import LandmarkService from "@/services/LandmarkService";
import SmallLandmarkCard from "@/components/SmallLandmarkCard.vue";

export default {
  components: {
    SmallLandmarkCard,
  },
  data() {
    return {
      itineraries: [],
      selectedItinerary: null,
      availableLandmarks: [],
      selectedCity: '',
      firstCityChange: true,
    };
  },
  methods: {
    async fetchLandmarks() {
      try {
        const initialCity = this.selectedCity;
        const response = await LandmarkService.listByCity(this.selectedCity);
        this.availableLandmarks = response.data;

        if (this.selectedItinerary.landmarkList.length > 0 &&
          this.selectedItinerary.landmarkList[0].city !== this.selectedCity) {

          if (this.firstCityChange) {
            const userConfirmed = window.confirm("Changing the city will reset the added landmarks. Do you want to continue?");

            if (userConfirmed) {
              this.selectedItinerary.landmarkList = [];
            } else {
              this.selectedCity = this.selectedItinerary.landmarkList[0].city;
              const revertResponse = await LandmarkService.listByCity(this.selectedCity);
              this.availableLandmarks = revertResponse.data;
              return;
            }

            this.firstCityChange = false;
          }
        }
      } catch (error) {
        console.error("Error fetching landmarks:", error);
        alert("There was an error fetching the landmarks. Please try again.");
      }
    },
    fetchItineraries() {
      itineraryService
        .listByUser()
        .then((response) => {
          this.itineraries = response.data;
        })
        .catch((error) => {
          console.error("There was an error fetching the itineraries:", error);
        });
    },
    updateItinerary(itinerary) {
      this.selectedItinerary = { ...itinerary };
      this.selectedCity = itinerary.landmarkList[0]?.city || '';
      this.fetchLandmarks();
      this.firstCityChange = true;
    },
    submitForm() {
      const itineraryId = this.selectedItinerary.id;
      itineraryService
        .updateItinerary(itineraryId, this.selectedItinerary)
        .then(() => {
          this.fetchItineraries();
          this.selectedItinerary = null;
          this.firstCityChange = true;
        })
        .catch((error) => {
          console.error("There was an error updating the itinerary:", error);
        });
    },
    deleteItinerary(itineraryId) {
      if (confirm("Are you sure you want to delete this itinerary?")) {
        itineraryService
          .deleteItinerary(itineraryId)
          .then(() => {
            this.fetchItineraries();
            this.firstCityChange = true;
          })
          .catch((error) => {
            console.error("There was an error deleting the itinerary:", error);
          });
      }
    },
    cancelEdit() {
      this.selectedItinerary = null;
      this.fetchItineraries();
    },
    isLandmarkAdded(landmark) {
      return this.selectedItinerary.landmarkList.some(
        (l) => l.id === landmark.id
      );
    },
    toggleLandmark({ landmark, isAdded }) {
      const index = this.selectedItinerary.landmarkList.findIndex(
        (l) => l.id === landmark.id
      );
      if (isAdded) {
        if (index === -1) {
          this.selectedItinerary.landmarkList.push(landmark);
        }
      } else {
        if (index !== -1) {
          this.selectedItinerary.landmarkList.splice(index, 1);
        }
      }
    },
  },
  created() {
    this.fetchItineraries();
  },
};
</script>

<style scoped>
.itinerary-list {
  max-width: 700px;
  margin: 50px auto;
  background: #ececec;
  padding: 30px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

.itinerary-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
}

.itinerary-table th,
.itinerary-table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
  font-size: 1rem;
}

.itinerary-table th {
  background-color: #f2f2f2;
  text-align: center;
  font-weight: bold;
}

.itinerary-table td:last-child {
  text-align: center;
  vertical-align: middle;
}

.action-buttons {
  display: flex;
  justify-content: center;
  gap: 5px;
}

.edit-btn,
.delete-btn {
  color: white;
  border: none;
  cursor: pointer;
  padding: 8px 12px;
  border-radius: 5px;
  margin-right: 5px;
}

.edit-btn {
  background-color: #2196f3;
}

.edit-btn:hover {
  background-color: #1976D2;
}

.delete-btn {
  background-color: #f44336;
}

.delete-btn:hover {
  background-color: #d32f2f;
}

.edit-form {
  background: blanchedalmond;
  padding: 50px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  margin-top: 20px;
  border: 2px wheat solid;
}

.edit-form h3 {
  text-align: center;
  margin-bottom: 20px;
}

.edit-form div {
  margin-bottom: 10px;
}

.edit-form label {
  display: block;
  margin-bottom: 5px;
}

.edit-form input {
  width: 100%;
  padding: 3%;
  box-sizing: border-box;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.edit-form button {
  color: white;
  border: none;
  cursor: pointer;
  padding: 10px 15px;
  font-size: 1rem;
  border-radius: 5px;
  margin-right: 10px;
}

.edit-form button[type="submit"] {
  background-color: #4CAF50;
}

.edit-form button[type="submit"]:hover {
  background-color: #45a049;
}

.edit-form button[type="button"] {
  background-color: #2196f3;
}

.edit-form button[type="button"]:hover {
  background-color: #1976D2;
}

.edit-form select {
  width: 100%;
  padding: 3%;
  box-sizing: border-box;
  border: 1px solid #ddd;
  border-radius: 5px;
  margin-bottom: 10px;
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

button {
  margin-top: 10px;
  padding: 10px 20px;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #1976D2;
}

button[type="submit"] {
  margin-top: 10%;
  background-color: #4CAF50;
}

button[type="submit"]:hover {
  background-color: #45A049;
}
</style>
