<template>
  <div class="landmark-details">
    <h1 class="landmark-name">{{ landmark.name }}, {{ landmark.city }}</h1>
    <p class="landmark-description">{{ landmark.description }}</p>
    <p class="landmark-venue-type">Venue Type: {{ landmark.venueType }}</p>
    <img v-if="landmark.imageUrl" :src="landmark.imageUrl" class="landmark-image" alt="Image of the landmark" />
    <div v-if="availability.length" class="hours-section">
      <h2>Hours of Operation</h2>
      <table class="hours-table">
        <thead>
          <tr>
            <th>Day</th>
            <th>Open Time</th>
            <th>Close Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="slot in availability" :key="slot.id">
            <td>{{ slot.dayOfWeek }}</td>
            <td>{{ slot.openTime && slot.closeTime ? slot.openTime : 'Closed' }}</td>
            <td>{{ slot.openTime && slot.closeTime ? slot.closeTime : 'Closed' }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
  
  <script>
  export default {
    props: {
      landmark: {
        type: Object,
        required: true
      },
      availability: {
        type: Array,
        required: true
      }
    }
  };
  </script>
  
  <style scoped>
.landmark-details {
  text-align: center;
  margin: 0 auto;
  padding: 20px;
  max-width: 90%;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.landmark-name {
  font-size: 2rem; 
  margin-bottom: 15px;
  color: #333;
}

.landmark-description {
  font-size: 1rem; 
  margin: 10px 0;
  color: #666;
}

.landmark-venue-type {
  font-size: 1rem; 
  margin: 5px 0;
  color: black;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

.landmark-image {
  width: 100%;
  max-width: 100%; 
  height: auto;
  margin-top: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.hours-section {
  margin: 20px 0;
}

.hours-table {
  margin: 0 auto;
  width: 100%;
  max-width: 100%; 
  border-collapse: collapse;
}

.hours-table th,
.hours-table td {
  border: 1px solid #ddd;
  padding: 10px; 
}

.hours-table th {
  background-color: #f4f4f4;
  text-align: center;
  color: #333;
}

.hours-table td {
  text-align: center;
  color: #555;
}

@media (max-width: 1024px) {
  .landmark-name {
    font-size: 1.75rem;
  }

  .landmark-description,
  .landmark-venue-type {
    font-size: 1rem;
  }

  .hours-table th,
  .hours-table td {
    font-size: 1rem;
    padding: 9px;
  }
}

@media (max-width: 768px) {
  .landmark-name {
    font-size: 1.5rem;
  }

  .landmark-description,
  .landmark-venue-type {
    font-size: 0.9rem;
  }

  .hours-table th,
  .hours-table td {
    font-size: 0.9rem;
    padding: 8px;
  }
}

@media (max-width: 480px) {
  .landmark-name {
    font-size: 1.25rem;
  }

  .landmark-description,
  .landmark-venue-type {
    font-size: 0.8rem;
  }

  .hours-table th,
  .hours-table td {
    font-size: 0.8rem;
    padding: 6px;
  }
}
  </style>
  