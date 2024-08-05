<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-else>Login</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'register' }">Register</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#nav {
  background-color: #333; 
  color: #fff;
  padding: 10px; 
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
</style>