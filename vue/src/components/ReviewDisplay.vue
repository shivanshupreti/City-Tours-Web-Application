<template>
    <div class="review" v-bind:key="review.id">
      <h4>{{ review.firstName }} {{ review.lastName }}</h4>
      <p class="review-date">{{ formatDate(review.createdAt) }}</p>
      <div class="rating">
        <span
          v-for="n in review.rating"
          :key="n"
          class="rating-star"
          v-bind:title="review.rating + ' Star Review'"
        >
          &#9733;
        </span>
      </div>
      <h3>{{ review.title }}</h3>
      <p>{{ review.description }}</p>
    </div>
  </template>
  
  <script>
  export default {
    props: ['review'],
    methods: {
      formatDate(timestamp) {
        const date = new Date(timestamp);
        return date.toLocaleString();
      }
    }
  };
  </script>
  
  <style scoped>
  .review {
    border: 1px black solid;
    border-radius: 6px;
    padding: 1rem;
    margin: 10px auto;
    width: 61%;
    text-align: center; 
    display: flex;
    flex-direction: column; 
    align-items: center; 
    justify-content: center; 
  }
  
  .review p {
    margin: 20px;
  }
  
  .review h3 {
    display: inline-block;
  }
  
  .review h4 {
    font-size: 1rem;
  }
  
  .rating {
    height: 2rem;
    display: inline-block;
    vertical-align: middle; /* Align stars vertically */
    margin: 0 0.5rem;
  }
  
  .rating-star {
    font-size: 2rem; /* Adjust font size as needed */
    color: gold; /* Star color */
    margin-right: 2px; /* Space between stars */
  }
  </style>
  