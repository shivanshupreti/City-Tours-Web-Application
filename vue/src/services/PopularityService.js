import axios from 'axios';

export default {
    list() {
        return axios.get('/popularity');
    },

    getPopularityById(id) {
        return axios.get(`/popularity/${id}`);
    },

    getPopularityByLandmarkId(landmarkId) {
        return axios.get(`/popularity/landmark/${landmarkId}`);
    },

    getPopularityByUserId(userId) {
        return axios.get(`/popularity/user/${userId}`);
    },

    addPopularity(popularity) {
        return axios.post('/popularity', popularity);
    },

    deletePopularityById(id) {
        return axios.delete(`/popularity/${id}`);
    },

    deletePopularityByLandmarkId(landmarkId) {
        return axios.delete(`/popularity/landmark/${landmarkId}`);
    },

    deletePopularityByUserId(userId) {
        return axios.delete(`/popularity/user/${userId}`);
    },

    removePopularityFromLandmark(landmarkId, userId) {
        return axios.delete(`/popularity/remove/${landmarkId}/${userId}`);
    },

    getPopularityCountByLandmarkId(landmarkId) {
        return axios.get(`/popularity/count/${landmarkId}`);
    }
};
