import axios from 'axios';

export default {
    list() {
        return axios.get('/itineraries');
    },

    getItinerary(id) {
        return axios.get(`/itineraries/${id}`);
    },

    createItinerary(itinerary) {
        return axios.post('/itineraries/new', itinerary);
    },

    updateItinerary(itinerary) {
        return axios.put(`/itineraries/update/${itinerary.id}`, itinerary);
    },

    deleteItinerary(id) {
        return axios.delete(`/itineraries/deleteItinerary/${id}`);
    },

    listByUser(userId) { 
        return axios.get(`/itineraries/yourItineraries/${userId}`);
    },

    addLandmarkToItinerary(itineraryLandmarks) {
        return axios.post(`/itineraries/${itineraryLandmarks.itineraryId}/add-landmarks`, itineraryLandmarks);
    },

    removeLandmarkFromItinerary(itineraryId, landmarkId) {
        return axios.delete(`/itineraries/${itineraryId}/landmarks/${landmarkId}`);
    },

    getLandmarksByItinerary(itineraryId) {
        return axios.get(`/itineraries/${itineraryId}/landmarks`);
    }
};
