<template>
    <div class="landmark-details">
      <h1 class="landmark-name">{{ landmark.name }}, {{ landmark.city }}</h1>
      <p class="landmark-description">{{ landmark.description }}</p>
      <p class="landmark-venue-type">Venue Type: {{ landmark.venueType }}</p>
      <img v-if="landmark.imageUrl" :src="landmark.imageUrl" class="landmark-image" />
      <div v-if="availability.length">
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
              <td>{{ slot.openTime && slot.closeTime ? `${slot.openTime}` : 'Closed' }}</td>
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
    margin: 20px;
  }
  
  .landmark-name {
    font-size: 2rem;
    margin-bottom: 10px;
  }
  
  .landmark-description {
    font-size: 1.2rem;
    margin: 10px 0;
  }
  
  .landmark-hours,
  .landmark-venue-type {
    font-size: 1rem;
    margin: 5px 0;
  }
  
  .landmark-image {
    width: 80%;
    max-width: 800px;
    height: auto;
    margin-top: 20px;
  }
  
  .hours-table {
    margin: 20px auto;
    width: 70%;
    border-collapse: collapse;
  }
  
  .hours-table th,
  .hours-table td {
    border: 1px solid #ddd;
    padding: 8px;
  }
  
  .hours-table th {
    background-color: #f2f2f2;
    text-align: center;
  }
  
  .hours-table td {
    text-align: center;
  }
  </style>
  