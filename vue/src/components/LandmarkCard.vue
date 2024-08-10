<template>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <div class="card" :class="{ visited: landmark.visited }">
        <h2 class="landmark-name">{{ landmark.name }}</h2>
        <img v-if="landmark.imageUrl" :src="landmark.imageUrl" />
        <h3 class="landmark-city">{{ landmark.city }}</h3>
        <p class="landmark-description">{{ landmark.name }}: {{ landmark.description }}</p>
        <div class="button-details">
            <router-link :to="{ name: 'LandmarkDetailView', params: { id: landmark.id } }">
                <button class="details">View More</button>
            </router-link>
        </div>
        <div class="popularity-background">
            <div class="popularity">
                <i :class="thumbsUpIconClass" @click="toggleThumbsUp"></i>
                <span>{{ thumbsUpCount }}</span>
                <span>|</span>
                <i :class="[thumbsDownIconClass, 'thumbs-down']" @click="toggleThumbsDown"></i>
                <span>{{ thumbsDownCount }}</span>
            </div>
        </div>
    </div>
</template>

<script>
import PopularityService from '@/services/PopularityService';

export default {
    props: {
        landmark: Object,
        enableAdd: {
            type: Boolean,
            default: false
        }
    },
    data() {
        return {
            isThumbsUp: false,
            isThumbsDown: false,
            thumbsUpCount: 0,
            thumbsDownCount: 0
        };
    },
    computed: {
        thumbsUpIconClass() {
            return this.isThumbsUp ? 'fa-solid fa-thumbs-up active-up' : 'fa-regular fa-thumbs-up';
        },
        thumbsDownIconClass() {
            return this.isThumbsDown ? 'fa-solid fa-thumbs-down active-down' : 'fa-regular fa-thumbs-down';
        }
    },
    async created() {
        await this.fetchPopularityCounts();
    },
    methods: {
    async fetchPopularityCounts() {
        try {
            const response = await PopularityService.getPopularityByLandmarkId(this.landmark.id);
            const popularityList = response.data;

            this.thumbsUpCount = popularityList.filter(p => p.rating === 'thumbs_up').length;
            this.thumbsDownCount = popularityList.filter(p => p.rating === 'thumbs_down').length;

            const userRating = popularityList.find(p => p.userId === this.$store.state.user.id);
            if (userRating) {
                this.isThumbsUp = userRating.rating === 'thumbs_up';
                this.isThumbsDown = userRating.rating === 'thumbs_down';
            }
        } catch (error) {
            console.error('Error fetching popularity counts:', error);
        }
    },
    async toggleThumbsUp() {
        if (this.$store.state.token === '') {
            this.$router.push({ name: 'login' });
            return;
        }
        
        if (this.isThumbsUp) {
            await PopularityService.removePopularityFromLandmark(this.landmark.id, this.$store.state.user.id);
            this.thumbsUpCount--;
        } else {
            if (this.isThumbsDown) {
                await PopularityService.removePopularityFromLandmark(this.landmark.id, this.$store.state.user.id);
                this.thumbsDownCount--;
                this.isThumbsDown = false;
            }
            await PopularityService.addPopularity({
                landmarkId: this.landmark.id,
                userId: this.$store.state.user.id,
                rating: 'thumbs_up'
            });
            this.thumbsUpCount++;
        }
        this.isThumbsUp = !this.isThumbsUp;
    },
    async toggleThumbsDown() {
        if (this.$store.state.token === '') {
            this.$router.push({ name: 'login' });
            return;
        }

        if (this.isThumbsDown) {
            await PopularityService.removePopularityFromLandmark(this.landmark.id, this.$store.state.user.id);
            this.thumbsDownCount--;
        } else {
            if (this.isThumbsUp) {
                await PopularityService.removePopularityFromLandmark(this.landmark.id, this.$store.state.user.id);
                this.thumbsUpCount--;
                this.isThumbsUp = false;
            }
            await PopularityService.addPopularity({
                landmarkId: this.landmark.id,
                userId: this.$store.state.user.id,
                rating: 'thumbs_down'
            });
            this.thumbsDownCount++;
        }
        this.isThumbsDown = !this.isThumbsDown;
    }
}

};
</script>

<style>
.card {
    border: 2px solid wheat;
    border-radius: 20px;
    width: 100%;
    max-width: 250px; 
    height: auto;
    margin: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    box-sizing: border-box; 
    background-color: blanchedalmond;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-color: wheat;
}

.card img {
    width: 100%;
    height: 150px; /* Adjust the height as needed */
    object-fit: cover;
    border-bottom: 2px solid wheat; 
}

.landmark-name {
    font-size: 1.5rem;
    height: 2rem;
    padding: 12px 10px; 
    font-family: 'Courier New', Courier, monospace;
}

.landmark-city {
    font-size: 1rem;
    padding: 0 10px;
    font-family: 'Courier New', Courier, monospace;
}

.landmark-description {
    font-size: 0.875rem;
    color: gray;
    margin: 0 10px 10px;
}

.button-details {
    margin-top: 20px;
    margin-bottom: 30px;
}

.checkbox-label {
    display: flex;
    align-items: center;
    justify-content: center; 
}

.checkbox-label input {
    margin-right: 8px;
}

.details {
    margin-left: 5px;
}

.popularity-background {
    background-color: whitesmoke;
    border-radius: 20px;
    padding: 10px 15px;
    margin-bottom: 20px;
    width: 40%;
    max-width: 200px;
    border: rgb(176, 176, 176) 1px solid;
}

.popularity {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    font-size: .7rem;
}

.popularity i {
    cursor: pointer;
    font-size: .9rem;
    /* Adjusts the size of the icons */
    width: 1.2rem;
    /* Ensures icons maintain their smaller size */
    height: 1.2rem;
    line-height: 1.2rem;
}

.popularity i.thumbs-down {
    transform: scaleX(-1);
    /* Flips the icon horizontally */
}

.active-up {
    color: blue;
}

.active-down {
    color: red;
}

@media (min-width: 600px) {
    .card {
        width: 45%; 
    }
}

@media (min-width: 900px) {
    .card {
        width: 30%; 
    }
}

@media (min-width: 1200px) {
    .card {
        width: 22%; 
    }
}
</style>