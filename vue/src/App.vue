<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-else>Login</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'register' }">Register</router-link>
    </div>
    <router-view />
    <footer id="footer">
      <hr class="footer-line" />
      <p>&copy; 2024 | Tech Elevator | NLR - Java Purple | All rights reserved.</p>
    </footer>
  </div>
</template>

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
  color:red; 
  transition: 1s;
}

#footer {
  background-color:darkgrey; 
  color: rgb(83, 2, 2);
  padding: 20px; 
  text-align: center;
  border-radius: 15px; 
  box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.2);
  margin-top: auto; 
}

#footer p {
  margin: 0;
} 

.footer-line {
  border: 0;
  border-top: 1px solid #fff;
  width: 50%; 
  margin: 10px auto; 
}
</style>