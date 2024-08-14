<template>
    <div>
      <review-display
        v-for="review in reviewsByLandmark"
        v-bind:key="review.id"
        v-bind:review="review"
      />
    </div>
  </template>
  
  <script>
  import ReviewDisplay from '../components/ReviewDisplay.vue';
  import ReviewService from '../services/ReviewService.js';
  
  export default {
    props: {
      landmarkId: {
        type: Number, // Enforce that landmarkId is a number (integer)
        required: true // Make it a required prop
      }
    },
    components: {
      ReviewDisplay
    },
    data() {
      return {
        reviewsByLandmark: []
      };
    },
    async created() {
      try {
        // Fetch reviews for the given landmarkId
        const response = await ReviewService.getApprovedReviewsByLandmarkId(this.landmarkId);
        this.reviewsByLandmark = response.data;
      } catch (error) {
        console.error('Error fetching reviews:', error);
        alert('There was an error loading the reviews. Please try again later.');
      }
    }
  };
  </script>
  
    