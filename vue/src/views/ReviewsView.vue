<template>
    <div class="review-view">
      <h1>{{ landmark.name }}</h1>
  
      <div class="actions">
        <router-link v-bind:to="{ name: 'home' }">Back to Home</router-link>&nbsp;|
        <router-link v-bind:to="{ name: 'add-review', params: { id: landmark.id } }">Add Review</router-link>
      </div>
  
      <div class="well-display" v-if="landmark.reviews && landmark.reviews.length">
        <average-summary v-bind:reviews="landmark.reviews" />
        <star-summary v-for="i in 5" v-bind:rating="i" v-bind:key="i" v-bind:reviews="landmark.reviews" />
      </div>
  
      <review-list v-if="landmark.reviews && landmark.reviews.length" v-bind:reviews="landmark.reviews" v-bind:landmark-id="landmarkId" />
    </div>
  </template>
  
  <script>
  import AverageSummary from '../components/AverageSummary.vue';
  import StarSummary from '../components/StarSummary.vue';
  import ReviewList from '../components/ReviewList.vue';
  import ReviewService from '../services/ReviewService.js';
  import LandmarkService from '../services/LandmarkService.js';
  
  export default {
    components: {
      AverageSummary,
      StarSummary,
      ReviewList
    },
    data() {
      return {
        landmark: {}
      };
    },
    computed: {
      landmarkId() {
        return Number(this.$route.params.id);
      }
    },
    methods: {
      fetchLandmarkDetails() {
        LandmarkService.getLandmark(this.landmarkId)
          .then(landmarkResponse => {
            this.landmark = landmarkResponse.data;
            return ReviewService.getApprovedReviewsByLandmarkId(this.landmarkId);
          })
          .then(reviewResponse => {
            this.landmark.reviews = reviewResponse.data;
            console.log('Review data to be sent:', this.landmark.reviews);
          })
          .catch(error => {
            console.error('Error fetching landmark details or reviews:', error);
          });
      }
    },
    created() {
      this.fetchLandmarkDetails();
    }
  };
  </script>
  
  <style scoped>
.review-view {
  margin: 0 auto;
  padding: 1rem;
  max-width: 1200px;
  background-color:whitesmoke;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.review-view h1 {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: 1rem;
  color: #333;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.actions {
  display: flex;
  justify-content: center; 
  margin-bottom: 2rem; 
}

.actions a {
  margin: 0 1rem; 
  color: #007bff;
  text-decoration: none;
  font-size: 1rem;
}

.actions a:hover {
  text-decoration: underline;
}

.well-display {
  display: flex;
  align-items: center; /* Centers items vertically if needed */
  gap: 0.2rem; /* Adjust space between items in the flex container */
  margin-bottom: 2rem; /* Space below the container */
  justify-content: center;
}

.description {
  font-size: 1.2rem;
  margin-bottom: 1.5rem;
  color: #555;
}

.star-summary {
  display: flex;
  align-items: center;
}

.average-summary {
  margin-bottom: 1rem;
}

.review-list {
  margin-top: 2rem;
}

@media (max-width: 768px) {
  .well-display {
    flex-direction: column;
    align-items: flex-start;
  }

  .actions {
    flex-direction: column;
    align-items: center;
  }

  .actions a {
    margin: 0.5rem 0;
  }
}
  </style>