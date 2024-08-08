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
  },

  listByCity(city) {
    return http.get(`/landmarks/city/${city}`);
  },

  listByVenueType(venueType) {
    return http.get(`/landmarks/venue/${venueType}`);
  },

  listByDayOfWeek(dayOfWeek) {
    return http.get(`/landmarks/availability/day/${dayOfWeek}`);
  },
  
  getAllLandmarks() {
    return http.get('/landmarks');
  }
}
