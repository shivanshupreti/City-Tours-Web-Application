<template>
    <div class="container">
        <h2>Create Itinerary</h2>
        <form @submit.prevent="handleSubmit">
            <div class="form-group">
                <label for="name">Itinerary Name:</label>
                <input type="text" id="name" v-model="itinerary.name" required />
            </div>
            <div class="form-group">
                <label for="startingPoint">Starting Point:</label>
                <input type="text" id="startingPoint" v-model="itinerary.startingPoint" required />
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" v-model="itinerary.date" required />
            </div>
            <div class="form-group">
                <label for="shared">Shared:</label>
                <select id="shared" v-model="itinerary.shared" required>
                    <option value="true">Yes</option>
                    <option value="false">No</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Create Itinerary</button>
            </div>
        </form>
    </div>
</template>

<script>
import ItineraryService from '../services/ItineraryService';

export default {
    data() {
        return {
            itinerary: {
                userId: this.$store.state.user.id,
                name: '',
                startingPoint: '',
                date: '',
                shared: 'false'
            }
        };
    },
    methods: {
        async handleSubmit() {
            try {
                await ItineraryService.createItinerary(this.itinerary);
                this.$router.push({ name: 'home' });
            } catch (error) {
                console.error('Error creating itinerary:', error);
                alert('There was an error creating the itinerary. Please try again.');
            }
        }
    }
};
</script>

<style scoped>
.container {
    max-width: 600px;
    margin: 50px auto;
    background: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}

.form-group button {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    padding: 10px;
    width: 100%;
}

.form-group button:hover {
    background-color: #45a049;
}
</style>