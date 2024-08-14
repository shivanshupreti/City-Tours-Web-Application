import axios from 'axios';
import router from '@/router/index.js';

const API_URL = '/reviews';

axios.interceptors.request.use(
  config => {
    const token = localStorage.getItem('token');
    console.log(`Token being used in request: ${token}`); // Log the token
    if (token) {
      config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

axios.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    if (error.response && (error.response.status === 401 || error.response.status === 403)) {
      alert('Your session has timed out. You will be redirected to the login page.');
      router.push('/logout');
    }
    return Promise.reject(error);
  }
);

export default {
  getAllReviews() {
    return axios.get(API_URL);
  },

  getAllApprovedReviews(id) {
    return axios.get(`${API_URL}/approved`);
  },

  getAllDisapprovedReviews() {
    return axios.get(`${API_URL}/disapproved`);
  },

  getReviewById(id) {
    return axios.get(`${API_URL}/${id}`);
  },

  createReview(review) {
    return axios.post(`${API_URL}/new`, review);
  },

  updateReview(id, review) {
    return axios.put(`${API_URL}/${id}`, review, {
      headers: {
        'Content-Type': 'application/json'
      }
    });
  },

  deleteReview(id) {
    return axios.delete(`${API_URL}/${id}`);
  },

  getAverageRatingByLandmarkId(landmarkId) {
    return axios.get(`${API_URL}/average-rating/${landmarkId}`);
  },

  getApprovedReviewsByLandmarkId(landmarkId) {
    return axios.get(`${API_URL}/approved/${landmarkId}`);
  }
};
