<template>
    <div class="admin-page">
      <h1>Admin Page</h1>
      <h2>Review Management</h2>
  
      <div class="review-filter">
        <label for="review-status">Filter Reviews:</label>
        <select v-model="selectedFilter" id="review-status">
          <option value="approved">Approved Reviews</option>
          <option value="disapproved">Disapproved Reviews</option>
        </select>
      </div>
  
      <table v-if="filteredReviews.length" class="reviews-table">
        <thead>
          <tr>
            <th>Title</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Rating</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="review in filteredReviews" :key="review.id">
            <td>{{ review.title }}</td>
            <td>{{ review.firstName }}</td>
            <td>{{ review.lastName }}</td>
            <td>{{ review.rating }}</td>
            <td>
              <div class="action-buttons">
                <button
                  v-if="selectedFilter === 'disapproved'"
                  class="approve-btn"
                  @click="approveReview(review)"
                >
                  Approve
                </button>
                <button
                  v-if="selectedFilter === 'approved'"
                  class="disapprove-btn"
                  @click="disapproveReview(review)"
                >
                  Disapprove
                </button>
                <button class="delete-btn" @click="deleteReview(review.id)">
                  Delete
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script>
  import ReviewService from "../services/ReviewService";
  
  export default {
    data() {
      return {
        reviews: [],
        approvedReviews: [],
        disapprovedReviews: [],
        selectedFilter: "approved", // Default filter set to 'approved'
      };
    },
  
    computed: {
      filteredReviews() {
        return this.selectedFilter === "approved"
          ? this.approvedReviews
          : this.disapprovedReviews;
      },
    },
  
    created() {
      this.fetchReviews();
    },
  
    methods: {
      fetchReviews() {
        ReviewService.getAllReviews()
          .then((response) => {
            this.reviews = response.data;
            this.approvedReviews = this.reviews.filter(
              (review) => review.approvalStatus
            );
            this.disapprovedReviews = this.reviews.filter(
              (review) => !review.approvalStatus
            );
          })
          .catch((error) => {
            console.error("Failed to fetch reviews:", error);
          });
      },
  
      approveReview(review) {
        review.approvalStatus = true;
        ReviewService.updateReview(review.id, review)
          .then(() => {
            this.fetchReviews();
          })
          .catch((error) => {
            console.error("Failed to approve review:", error);
          });
      },
  
      disapproveReview(review) {
        review.approvalStatus = false;
        ReviewService.updateReview(review.id, review)
          .then(() => {
            this.fetchReviews();
          })
          .catch((error) => {
            console.error("Failed to disapprove review:", error);
          });
      },
  
      deleteReview(id) {
        ReviewService.deleteReview(id)
          .then(() => {
            this.fetchReviews();
          })
          .catch((error) => {
            console.error("Failed to delete review:", error);
          });
      },
    },
  };
  </script>
  
  <style scoped>
  .admin-page {
    max-width: 700px;
    margin: 50px auto;
    background: #ececec;
    padding: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }
  
  h1,
  h2 {
    text-align: center;
    margin-bottom: 20px;
  }
  
  .review-filter {
    margin-bottom: 20px;
  }
  
  .reviews-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
  }
  
  .reviews-table th,
  .reviews-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
    font-size: 1rem;
  }
  
  .reviews-table th {
    background-color: #f2f2f2;
    text-align: center;
    font-weight: bold;
  }
  
  .reviews-table td:last-child {
    text-align: center;
    vertical-align: middle;
  }
  
  .action-buttons {
    display: flex;
    justify-content: center;
    gap: 5px;
  }
  
  button.approve-btn {
    background-color: #4caf50;
    color: white;
    border: none;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 5px;
  }
  
  button.approve-btn:hover {
    background-color: #45a049;
  }
  
  button.disapprove-btn {
    background-color: #ffa500;
    color: white;
    border: none;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 5px;
  }
  
  button.disapprove-btn:hover {
    background-color: #ff8c00;
  }
  
  button.delete-btn {
    background-color: #f44336;
    color: white;
    border: none;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 5px;
  }
  
  button.delete-btn:hover {
    background-color: #d32f2f;
  }
  </style>