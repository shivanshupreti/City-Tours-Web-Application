<template>
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