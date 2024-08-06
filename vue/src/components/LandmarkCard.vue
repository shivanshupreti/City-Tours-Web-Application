<template>
    <div class="card" :class="{ visited: landmark.visited }">
        <h2 class="landmark-name">{{ landmark.name }}</h2>
        <img v-if="landmark.imageUrl" :src="landmark.imageUrl" />
        <h3 class="landmark-city">{{ landmark.city }}</h3>
        <p class="landmark-description">{{ landmark.name }}: {{ landmark.description }}</p>
        <div class="button-container" v-if="!enableAdd">
            <label class="checkbox-label">
                <input type="checkbox" :checked="landmark.visited" @change="handleCheckboxChange" />
                <span>{{ landmark.visited ? 'Saved' : 'Save To Itinerary' }}</span>
            </label>
        </div>
        <div class="button-details">
            <router-link :to="{ name: 'LandmarkDetailView', params: { id: landmark.id } }">
                <button class="details">View More</button>
            </router-link>
        </div>
        <button v-if="enableAdd" v-on:click.prevent="addToItineraryList(landmark)">Save To Itinerary</button>
    </div>
</template>

<script>
export default {
    props: {
        landmark: Object,
        enableAdd: {
            type: Boolean,
            default: false
        }
    },
    methods: {
        handleCheckboxChange(event) {
            const isChecked = event.target.checked;
            this.setVisited(isChecked);
            if (isChecked) {
                this.addToItineraryList(this.landmark);
            } else {
                this.removeFromItineraryList(this.landmark);
            }
        },
        setVisited(value) {
            this.$store.commit('SET_VISITED_STATUS', { landmark: this.landmark, value });
        },
        addToItineraryList(landmark) {
            let addedLandmark = { ...landmark, visited: true };
            this.$store.commit('SAVE_LANDMARK', addedLandmark);
        },
        removeFromItineraryList(landmark) {
            let removedLandmark = { ...landmark, visited: false };
            this.$store.commit('REMOVE_LANDMARK', removedLandmark);
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
    background-color:blanchedalmond;
}

.card img {
    width: 100%;
    height: 100%;
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