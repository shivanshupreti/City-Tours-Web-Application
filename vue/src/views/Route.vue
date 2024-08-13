<template>
    <div class="route-view" v-if="itinerary">
      <h2>{{ itinerary.name }} - Route</h2>
      <p><strong>Starting Point:</strong> {{ itinerary.startingPoint }}</p>
      <p><strong>Date:</strong> {{ itinerary.date }}</p>
      <p><strong>Shared:</strong> {{ itinerary.shared ? 'Yes' : 'No' }}</p>
  
      <h3>Landmarks</h3>
      <ul>
        <li v-for="landmark in itinerary.landmarkList" :key="landmark.id">
          {{ landmark.name }}
        </li>
      </ul>
  
      <h3>Optimized Route</h3>
      <div v-if="optimizedRoute">
        <h4>Order of Visit</h4>
        <ul>
          <li v-for="(placeId, index) in optimizedRoute.itinerary" :key="index">
            {{ getLandmarkName(placeId) }}
          </li>
        </ul>
  
        <h4>Coordinates</h4>
        <ul>
          <li v-for="(coords, placeId) in optimizedRoute.coordinates" :key="placeId">
            {{ getLandmarkName(placeId) }}: {{ coords[0] }}, {{ coords[1] }}
          </li>
        </ul>
      </div>
  
      <button @click="goBack">Back to Itineraries</button>
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>
  </template>
  
  <script>
  import itineraryService from "@/services/ItineraryService";
  
  export default {
    data() {
      return {
        itinerary: null,
        optimizedRoute: null,
      };
    },
    async created() {
      const itineraryId = this.$route.query.id;
      if (itineraryId) {
        try {
          const itineraryResponse = await itineraryService.getItinerary(itineraryId);
          this.itinerary = itineraryResponse.data;
  
          // Get place ID for the starting point
          const startingPointName = this.itinerary.startingPoint;
          const placeIdResponse = await itineraryService.getStartingPlaceIdByName(startingPointName);
          const origin = placeIdResponse.data;
  
          // Prepare the data for getOptimizedRoute
          const destinations = this.itinerary.landmarkList.map(landmark => landmark.placeId).join(',');
  
          // Get the optimized route
          const routeResponse = await itineraryService.getOptimizedRoute(origin, destinations);
          this.optimizedRoute = routeResponse.data;
        } catch (error) {
          console.error("Error fetching itinerary, place ID, or optimized route:", error);
          alert("There was an error fetching the itinerary, place ID, or optimized route. Please try again.");
        }
      }
    },
    methods: {
      goBack() {
        this.$router.go(-1);
      },
      getLandmarkName(placeId) {
        const landmark = this.itinerary.landmarkList.find(l => l.placeId === placeId);
        return landmark ? landmark.name : placeId;
      }
    },
  };
  </script>
  

  
  
  <style scoped>
  .route-view {
    max-width: 700px;
    margin: 50px auto;
    background: #ececec;
    padding: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }
  
  h2, h3, h4 {
    text-align: center;
    margin-bottom: 20px;
  }
  
  ul {
    list-style-type: none;
    padding: 0;
    font-size: 1.2rem;
  }
  
  li {
    background: #fff;
    margin: 10px 0;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }
  
  button {
    display: block;
    margin: 20px auto;
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
  </style>
  