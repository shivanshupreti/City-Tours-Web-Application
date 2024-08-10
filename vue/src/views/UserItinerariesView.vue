<template>
    <div class="itinerary-list">
      <h2>Your Itineraries</h2>
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
              <button @click="updateItinerary(itinerary)" class="edit-btn">Edit</button>
              <button @click="deleteItinerary(itinerary.id)" class="delete-btn">Delete</button>
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
          <button type="submit">Save Changes</button>
          <button type="button" @click="cancelEdit">Cancel</button>
        </form>
      </div>
    </div>
  </template>
  
  <script>
  import itineraryService from "@/services/ItineraryService";
  
  export default {
    data() {
      return {
        itineraries: [],
        selectedItinerary: null, // To hold the itinerary being edited
      };
    },
    methods: {
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
        this.selectedItinerary = { ...itinerary }; // Clone the itinerary to avoid direct mutation
      },
      submitForm() {
        const itineraryId = this.selectedItinerary.id;
        itineraryService
          .updateItinerary(itineraryId, this.selectedItinerary)
          .then(() => {
            this.fetchItineraries(); // Refresh the itineraries list
            this.selectedItinerary = null; // Reset the form
          })
          .catch((error) => {
            console.error("There was an error updating the itinerary:", error);
          });
      },
      deleteItinerary(itineraryId) {
        console.log(itineraryId);
        if (confirm("Are you sure you want to delete this itinerary?")) {
          itineraryService
            .deleteItinerary(itineraryId)
            .then(() => {
              this.fetchItineraries(); // Refresh the itineraries list after deletion
            })
            .catch((error) => {
              console.error("There was an error deleting the itinerary:", error);
            });
        }
      },
      cancelEdit() {
        this.selectedItinerary = null; // Reset the form
      },
    },
    created() {
      this.fetchItineraries();
    },
  };
  </script>
  
  <style scoped>
   .itinerary-list{
    max-width: 600px;
    margin: 50px auto;
    background: #ececec;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  h2{
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
  
  .delete-btn{
    background-color: #f44336;
  }

  .delete-btn:hover {
    background-color: #d32f2f;
  }

  .edit-form {
    margin-top: 20px;
    border: 2px wheat solid;
    background: blanchedalmond;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  .edit-form h3{
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
  </style>
  
  