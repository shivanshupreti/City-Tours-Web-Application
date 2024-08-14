<template>
    <div class="route-view" v-if="itinerary">
        <h2>{{ itinerary.name }}</h2>
        <div id="map" style="height: 500px; width: 100%;"></div>
        <div v-if="optimizedRoute">
            <div class="timeline">
                <div v-for="(placeId, index) in optimizedRoute.itinerary" :key="index" class="timeline-item">
                    <div class="timeline-marker">{{ index + 1 }}</div>
                    <div class="timeline-content">
                        {{ index === 0 ? itinerary.startingPoint : getLandmarkName(placeId) }}
                    </div>
                </div>
            </div>
        </div>
        <button @click="goBack">Back to Itineraries</button>
        <button @click="addToUserItineraries">Add to My Itineraries</button>
    </div>
    <div v-else>
        <p>Loading...</p>
    </div>
</template>

<script>
/* global google */
import itineraryService from "@/services/ItineraryService";

export default {
    data() {
        return {
            itinerary: null,
            optimizedRoute: null,
        };
    },
    async created() {
        const itineraryId = this.$route.params.id;
        if (itineraryId) {
            try {
                const itineraryResponse = await itineraryService.getSharedItineraryById(itineraryId);
                this.itinerary = itineraryResponse.data;

                const startingPointName = this.itinerary.startingPoint;
                const placeIdResponse = await itineraryService.getStartingPlaceIdByName(startingPointName);
                const origin = placeIdResponse.data;

                const destinations = this.itinerary.landmarkList.map(landmark => landmark.placeId).join(',');

                const routeResponse = await itineraryService.getOptimizedRoute(origin, destinations);
                this.optimizedRoute = routeResponse.data;

                this.$nextTick(() => {
                    this.initMap();
                });
            } catch (error) {
                console.error("Error fetching shared itinerary or optimized route:", error);
                alert("There was an error fetching the shared itinerary or optimized route. Please try again.");
            }
        }
    },
    methods: {
        goBack() {
            this.$router.go(-1);
        },
        getLandmarkName(placeId) {
            const landmark = this.itinerary.landmarkList.find(l => l.placeId === placeId);
            return landmark ? landmark.name : placeId;
        },
        initMap() {
            if (!this.optimizedRoute) return;

            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 10,
                center: {
                    lat: this.optimizedRoute.coordinates[0][0],
                    lng: this.optimizedRoute.coordinates[0][1],
                },
            });

            const directionsService = new google.maps.DirectionsService();
            const directionsRenderer = new google.maps.DirectionsRenderer({
                suppressMarkers: true,
            });
            directionsRenderer.setMap(map);

            const waypoints = this.optimizedRoute.itinerary.slice(1, -1).map((placeId, index) => ({
                location: new google.maps.LatLng(this.optimizedRoute.coordinates[index + 1][0], this.optimizedRoute.coordinates[index + 1][1]),
                stopover: true,
            }));

            const request = {
                origin: new google.maps.LatLng(this.optimizedRoute.coordinates[0][0], this.optimizedRoute.coordinates[0][1]),
                destination: new google.maps.LatLng(this.optimizedRoute.coordinates[this.optimizedRoute.coordinates.length - 1][0], this.optimizedRoute.coordinates[this.optimizedRoute.coordinates.length - 1][1]),
                waypoints: waypoints,
                travelMode: 'DRIVING',
            };

            directionsService.route(request, (result, status) => {
                if (status === google.maps.DirectionsStatus.OK) {
                    directionsRenderer.setDirections(result);
                } else {
                    console.error('Error fetching directions:', status);
                }
            });

            this.optimizedRoute.itinerary.forEach((placeId, index) => {
                const coords = this.optimizedRoute.coordinates[index];
                const label = String.fromCharCode(65 + index);
                let address;
                if (index === 0) {
                    address = this.itinerary.startingPoint;
                } else {
                    address = this.getLandmarkName(placeId);
                }

                const marker = new google.maps.Marker({
                    position: { lat: coords[0], lng: coords[1] },
                    map: map,
                    title: address,
                    label: {
                        text: label,
                        color: "black",
                        fontSize: "14px",
                        fontWeight: "bold",
                    },
                });

                const infoWindow = new google.maps.InfoWindow({
                    content: `<div>${address}</div>`,
                });

                marker.addListener('click', () => {
                    infoWindow.open(map, marker);
                });
            });
        },
        async addToUserItineraries() {
            try {
                // Clone the shared itinerary and modify as needed
                const newItinerary = { ...this.itinerary };
                delete newItinerary.id; // Remove the ID to create a new itinerary

                // Add the itinerary to the user's list
                await itineraryService.createItinerary(newItinerary);
                alert("Itinerary added to your list successfully!");
            } catch (error) {
                console.error("Error adding itinerary to user's list:", error);
                alert("There was an error adding the itinerary to your list. Please try again.");
            }
        }
    },
};
</script>

<style scoped>
.timeline {
    position: relative;
    padding: 20px 0;
    margin: 0 auto;
    max-width: 600px;
}

.timeline-item {
    position: relative;
    margin: 10px 0;
    padding: 10px;
    border-left: 2px solid #2196F3;
}

.timeline-marker {
    position: absolute;
    left: -18px;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-color: #2196F3;
    color: white;
    text-align: center;
    line-height: 30px;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

#map {
    height: 500px;
    width: 100%;
    border: none; 
    border-radius: 8px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
}

.timeline-content {
    margin-left: 40px;
}

.route-view {
    max-width: 700px;
    margin: 50px auto;
    background: #ececec;
    padding: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 8px;
}

h2 {
    font-size: 2rem; 
    color: #333; 
    font-weight: bold; 
    text-align: center; 
    margin-top: 10px; 
    margin-bottom: 20px;
    font-family:'Courier New', Courier, monospace; 
}

h3,
h4 {
    text-align: center;
    margin-bottom: 20px;
}

ul {
    list-style-type: none;
    padding: 0;
    font-size: 1.2rem;
}

li {
    background: #fff;
    margin: 10px 0;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: #2196f3;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

button:hover {
    background-color: #1976D2;
}
</style>
