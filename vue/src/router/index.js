import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import LandmarkDetailView from '../views/LandmarkDetailView.vue';
import CreateItineraryView from '../views/CreateItineraryView.vue';
import UserItinerariesView from '../views/UserItinerariesView.vue';
import Route from '../views/Route.vue';
import AddReviewView from '../views/AddReviewView.vue';
import ReviewsView from '../views/ReviewsView.vue';
import AdminPageView from '../views/AdminPageView.vue';
/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  },
  { path: '/landmarks/:id', 
    name: 'LandmarkDetailView', 
    component: LandmarkDetailView,
    props: true,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/itineraries/new",
    name: "createItinerary",
    component: CreateItineraryView,
    meta:{
      requiresAuth: true
    }
  },
  {
    path: "/itineraries/yourItineraries", 
    name: "userItineraries",
    component: UserItinerariesView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: "/itineraries/yourItineraries/route", 
    name: "route",
    component: Route,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/itineraries/shared/:id',
    name: 'SharedItinerary',
    component: () => import('@/components/SharedRoute.vue'),
    props: route => ({ itineraryId: route.params.id })
  },
  {
    path: "/landmarks/:id/add-review", 
    name: "add-review",
    component: AddReviewView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: "/landmarks/:id/reviews", 
    name: "reviews",
    component: ReviewsView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/admin",
    name: "Admin",
    component: AdminPageView,
    
  }

];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { top: 0 };
    }
  }
});

router.beforeEach((to) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return {name: "login"};
  }
  // Otherwise, do nothing and they'll go to their next destination
});

export default router;
