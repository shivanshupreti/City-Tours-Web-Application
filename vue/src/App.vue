<template>
  <head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  </head>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>
      <span v-if="!$store.state.token || $store.state.token">|</span>
      <router-link v-bind:to="{ name: 'register' }" v-if="!$store.state.token">Register</router-link>
      <span v-if="!$store.state.token">|</span>
      <router-link v-bind:to="{ name: 'createItinerary' }" v-if="$store.state.token">Create Itinerary</router-link>
      <span v-if="$store.state.token">|</span>
      <router-link v-bind:to="{ name: 'userItineraries' }" v-if="$store.state.token">My Itineraries</router-link>
      <span v-if="$store.state.token">|</span>
      <router-link v-bind:to="{name: 'Admin'}" v-if="$store.state.token && $store.state.user.authorities[0].name === 'ROLE_ADMIN'">Admin Page</router-link>
      <span v-if="$store.state.token && $store.state.user.authorities[0].name === 'ROLE_ADMIN'">|</span>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-else>Login</router-link>
    </div>
    <router-view />
    <div class="gallery-footer">
    <!-- Gallery Section -->
    <div class="owl-carousel">
      <a href="#" class="gallery__photo">
        <img src="https://images.unsplash.com/photo-1587354246490-7e26e63fcaa1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dGhhaWxhbmR8ZW58MHwyfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60" alt="" />
        <div class="gallery__fade">
          <i class="gallery__icon fab fa-instagram"></i>
        </div>
      </a>
      <a href="#" class="gallery__photo">
        <img src="https://images.unsplash.com/photo-1510872893374-80379d91fc92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" alt="" />
        <div class="gallery__fade">
          <i class="gallery__icon fab fa-instagram"></i>
        </div>
      </a>
      <a href="#" class="gallery__photo">
        <img src="https://images.unsplash.com/photo-1590785204309-9888edf27ab7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRoYWlsYW5kfGVufDB8MnwwfHw%3D&auto=format&fit=crop&w=500&q=60" alt="" />
        <div class="gallery__fade">
          <i class="gallery__icon fab fa-instagram"></i>
        </div>
      </a>
      <a href="#" class="gallery__photo">
        <img src="https://images.unsplash.com/photo-1507646227500-4d389b0012be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80" alt="" />
        <div class="gallery__fade">
          <i class="gallery__icon fab fa-instagram"></i>
        </div>
      </a>
    </div>
    <!-- Footer Section -->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="footer-col">
            <h4>Company</h4>
            <ul>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Our Services</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Affiliate Program</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Get Help</h4>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Shipping</a></li>
              <li><a href="#">Returns</a></li>
              <li><a href="#">Order Status</a></li>
              <li><a href="#">Payment Options</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Online Booking</h4>
            <ul>
              <li><a href="#">Flights</a></li>
              <li><a href="#">Hotels</a></li>
              <li><a href="#">Car Rentals</a></li>
              <li><a href="#">Tours & Activities</a></li>
            </ul>
          </div>
          <div class="footer-col">
            <h4>Follow Us</h4>
            <div class="social-links">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
  </div>
</template>
<script>
export default {
  name: 'App',
};
</script>

<style scoped>
#nav {
  background-color: #333;
  color: #fff;
  padding: 15px;
  display: flex;
  justify-content: center;
  border-radius: 15px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

#nav a {
  color: #fff;
  text-decoration: none;
  margin: 0 10px;
  font-size: 1rem;
}

#nav a:hover {
  color: red;
  transition: 1s;
}

.gallery-footer {
  background-color: #2d2f31; /* Background color for the gallery section */
  padding: 20px;
}

/* Gallery styles */
.owl-carousel {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20%, 1fr)); /* Adjust as needed */
  gap: 10px; /* Space between images */
  margin-bottom: 1%;
}

.gallery__photo {
  position: relative;
  overflow: hidden;
  width: 100%;
  height: 0;
  padding-bottom: 100%; /* Square aspect ratio */
  background-color: #ddd;
}

.gallery__photo img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.gallery__fade {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.gallery__photo:hover .gallery__fade {
  opacity: 1;
}

.gallery__icon {
  color: #fff;
  font-size: 70px;
  transition: color 0.3s ease;
}

.gallery__photo:hover .gallery__icon {
  color: #e91e63;
  font-size: 70px;
}
/* Footer styles */
.footer {
  background-color: #24262b;
  padding: 70px;
  color: #fff;
}

.container {
  max-width: 1170px;
  margin: 0 auto;
}

.row {
  display: flex;
  flex-wrap: wrap;
}

.footer-col {
  flex: 1; /* Ensures columns take equal width */
  padding: 0 15px;
  box-sizing: border-box; /* Ensures padding does not affect width */
}

.footer-col h4 {
  font-size: 18px;
  color: #ffffff;
  text-transform: capitalize;
  margin-bottom: 35px;
  font-weight: 500;
  position: relative;
}

.footer-col h4::before {
  content: '';
  position: absolute;
  left: 0;
  bottom: -10px;
  background-color: #e91e63;
  height: 2px;
  box-sizing: border-box;
  width: 50px;
}

.footer-col ul {
  list-style: none;
  padding: 0;
}

.footer-col ul li {
  margin-bottom: 10px;
}

.footer-col ul li a {
  font-size: 16px;
  text-transform: capitalize;
  color: #bbbbbb;
  text-decoration: none;
  font-weight: 300;
  display: block;
  transition: all 0.3s ease;
}

.footer-col ul li a:hover {
  color: #ffffff;
  padding-left: 8px;
}

.footer-col .social-links a {
  display: inline-block;
  height: 40px;
  width: 40px;
  background-color: rgba(255, 255, 255, 0.2);
  margin: 0 10px 10px 0;
  text-align: center;
  line-height: 40px;
  border-radius: 50%;
  color: #ffffff;
  transition: all 0.5s ease;
}

.footer-col .social-links a:hover {
  color: #24262b;
  background-color: #ffffff;
}

/* Responsive */
@media (min-width: 768px) {
  .footer-col {
    flex: 1; /* Ensures columns take equal width */
    min-width: 25%; /* Makes sure there are four columns */
  }
}

@media (max-width: 767px) {
  .footer-col {
    width: 50%;
    margin-bottom: 30px;
  }
}

@media (max-width: 574px) {
  .footer-col {
    width: 100%;
  }
}
</style>