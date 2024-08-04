import axios from 'axios';

const http = axios.create({
  baseURL: import.meta.env.VITE_REMOTE_API
});

export default {
  list(city) {
    return http.get(`/landmarks/city/${city}`);
  },

  getLandmark(id) {
    return http.get(`/landmarks/${id}`);
  },

  getAvailability(id) {
    return http.get(`/landmarks/availability/${id}`);
  }
}
