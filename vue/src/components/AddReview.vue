<template>
    <div class="review-container">
      <h1>Add Review</h1>
      <form @submit.prevent="addNewReview">
        <div class="form-row">
          <div class="form-element">
            <label for="firstName">First Name:</label>
            <input id="firstName" type="text" v-model="newReview.firstName" required />
          </div>
          <div class="form-element">
            <label for="lastName">Last Name:</label>
            <input id="lastName" type="text" v-model="newReview.lastName" required />
          </div>
        </div>
        <div class="form-element">
          <label for="title">Title:</label>
          <input id="title" type="text" v-model="newReview.title" required />
        </div>
        <div class="form-element">
          <label for="rating">Rating:</label>
          <div id="rating" class="star-rating">
            <span v-for="star in 5" :key="star" @mouseover="hoverRating(star)" @mouseleave="hoverRating(0)"
              @click="selectRating(star)" :class="{ 'filled-star': star <= newReview.rating || star <= hoverValue }"
              class="star">&#9733;</span>
          </div>
        </div>
        <div class="form-element">
          <label for="review">Review:</label>
          <textarea id="review" v-model="newReview.description" required></textarea>
        </div>
        <div class="form-buttons">
          <input type="submit" value="Save" />
          <input type="button" value="Cancel" @click="resetForm" />
        </div>
      </form>
    </div>
  </template>
  
  <script>
  import ReviewService from '../services/ReviewService';
  export default {
    props: ['landmarkId', 'userId'],
    data() {
      return {
        newReview: {
          userId: this.$store.state.user.id,
          landmarkId: this.landmarkId,
          firstName: '',
          lastName: '',
          title: '',
          rating: 0,
          description: '',
          createdAt: new Date().toISOString(), // Full TIMESTAMP format
          approvalStatus: false
        },
        hoverValue: 0
      };
    },
    methods: {
      async addNewReview() {
        try {
          console.log('Review data to be sent:', this.newReview);
          await ReviewService.createReview(this.newReview);
          window.scrollTo(0, 0);
          this.$router.push({ name: 'reviews', params: { id: this.landmarkId } });
        } catch (error) {
          console.error('Error creating itinerary:', error);
          alert('There was an error creating the itinerary. Please try again.');
        }
      },
      resetForm() {
        this.newReview = {};
        this.$router.push({ name: 'reviews', params: { id: this.landmarkId } });
      },
      hoverRating(value) {
        this.hoverValue = value;
      },
      selectRating(value) {
        this.newReview.rating = value;
      }
    }
  };
  </script>
  <style>
  .review-container {
    max-width: 500px;
    margin: 7% auto;
    padding: 20px;
    background-color: #f5f5f5;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  }
  
  h1 {
    text-align: center;
    margin-bottom: 40px;
    color: #333;
    font-family: 'Arial', sans-serif;
    font-size: 24px;
  }
  
  .form-row {
    display: flex;
    justify-content: space-between;
    gap: 20px; /* Increased space between columns */
  }
  
  .form-element {
    flex: 1;
    text-align: left;
    margin-bottom: 15px; /* Increased space between rows */
  }
  
  .form-element label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  .form-element input,
  .form-element textarea {
    width: 100%;
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }
  
  .form-element textarea {
    height: 80px;
  }
  
  .star-rating {
    display: inline-block;
  }
  
  .star {
    font-size: 2em;
    cursor: pointer;
    color: #ccc;
  }
  
  .filled-star {
    color: gold;
  }
  
  .form-buttons {
    margin-top: 20px;
    text-align: left;
  }
  
  form input[type=button],
  form input[type=submit] {
    width: 120px;
    padding: 10px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 16px;
  }
  
  form input[type=submit] {
    background-color: #28a745;
    color: white;
    margin-right: 10px;
  }
  
  form input[type=button] {
    background-color: #dc3545;
    color: white;
  }
  
  form input[type=submit]:hover {
    background-color: #218838;
  }
  
  form input[type=button]:hover {
    background-color: #c82333;
  }
  </style>
  