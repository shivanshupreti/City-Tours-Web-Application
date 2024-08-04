<template>
  <div id="login" class="text-center">
    <div class="form-container">
      <form v-on:submit.prevent="login">
        <h1>Please Sign In</h1>
        <div role="alert" v-if="invalidCredentials" class="alert">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration" class="alert">
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group">
          <label for="username">Username</label>
          <input type="text" id="username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password</label>
          <input type="password" id="password" v-model="user.password" required />
        </div>
        <button type="submit">Sign in</button>
        <p>
          <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit('SET_AUTH_TOKEN', response.data.token);
            this.$store.commit('SET_USER', response.data.user);
            this.$router.push('/');
          }
        })
        .catch((error) => {
          const response = error.response;
          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style scoped>
#login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #ffffff;
}

.form-container {
  background: #ececec;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(133, 133, 133, 0.1);
  width: 300px;
  height: 320px;
  padding-right: 60px;
}

h1 {
  margin-bottom: 2rem;
}

.text-center {
  text-align: center;
}

.alert {
  color: rgb(5, 138, 49);
  margin-bottom: 1rem;
}

.form-input-group {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
}

label {
  flex-basis: 30%;
  text-align: right;
  margin-right: 1rem;
}

input {
  flex-basis: 70%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  background: #fcfcfc;
}

button {
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 20px;
  margin-bottom: 10px;
}

button:hover {
  background-color: #0056b3;
}
</style>
