import axios from 'axios';

// Create an Axios instance with a base URL
// const http = axios.create({
//     baseURL: import.meta.env.VITE_REMOTE_API
// });

// // Function to get the auth token from local storage
// const getToken = () => {
//     return localStorage.getItem('authToken') || '';
// };

// // Add a request interceptor to include the token in headers
// http.interceptors.request.use(config => {
//     const token = getToken();
//     if (token) {
//         config.headers['Authorization'] = `Bearer ${token}`;
//     }
//     return config;
// }, error => {
//     return Promise.reject(error);
// });

// // Add a response interceptor to handle token refresh and errors
// http.interceptors.response.use(response => {
//     return response;
// }, async error => {
//     const originalRequest = error.config;
    
//     // Handle token expiration
//     if (error.response.status === 401 && !originalRequest._retry) {
//         originalRequest._retry = true;

//         try {
//             const refreshToken = localStorage.getItem('refreshToken');
//             const response = await axios.post(`${import.meta.env.VITE_REMOTE_API}/refresh-token`, { refreshToken });
//             const { accessToken } = response.data;

//             // Store the new access token
//             localStorage.setItem('authToken', accessToken);

//             // Retry the original request with the new token
//             http.defaults.headers['Authorization'] = `Bearer ${accessToken}`;
//             originalRequest.headers['Authorization'] = `Bearer ${accessToken}`;
//             return http(originalRequest);
//         } catch (refreshError) {
//             // Handle token refresh failure
//             window.location.href = '/login';
//         }
//     }

//     return Promise.reject(error);
// });

export default {
    list(){
        return axios.get('/itineraries');
    },

    getItinerary(id){
        return axios.get(`/itineraries/${id}`);
    },

    createItinerary(itinerary){
        return axios.post('/itineraries/new', itinerary);
    },

    updateItinerary(itinerary){
        return axios.put(`/itineraries/${itinerary.id}`, itinerary);
    },

    deleteItinerary(id){
        return axios.delete(`/itineraries/${id}`);
    },

    listByUser(userId){ 
        return axios.get(`/itineraries/user/${userId}`);
    },

    addLandmarkToItinerary(itineraryId, landmarkId){
        return axios.post(`/itinerary/${itineraryId}/landmark/${landmarkId}`);
    },

    removeLandmarkFromItinerary(itineraryId, landmarkId){
        return axios.delete(`/itinerary/${itineraryId}/landmark/${landmarkId}`);
    },

    getLandmarksByItinerary(itineraryId){
        return axios.get(`/itinerary/${itineraryId}/landmarks`);
    }
};
