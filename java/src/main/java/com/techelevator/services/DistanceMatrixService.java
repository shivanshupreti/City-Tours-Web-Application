package com.techelevator.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@CrossOrigin
@Service
public class DistanceMatrixService {
    private static final String GOOGLE_MAPS_API_URL = "https://maps.googleapis.com/maps/api/distancematrix/json";
    private static final String GOOGLE_PLACES_API_URL = "https://maps.googleapis.com/maps/api/place/details/json";

    @Value("${google.maps.api.key}")
    private String apiKey;

    private final RestTemplate restTemplate = new RestTemplate();

    public int[][] getDistanceMatrix(String origin, List<String> destinations) {
        String formattedOrigin = "place_id:" + origin;
        String formattedDestinations = destinations.stream()
                .map(id -> "place_id:" + id)
                .collect(Collectors.joining("|"));

        URI uri = UriComponentsBuilder.fromHttpUrl(GOOGLE_MAPS_API_URL)
                .queryParam("origins", formattedOrigin)
                .queryParam("destinations", formattedDestinations)
                .queryParam("key", apiKey)
                .build().toUri();

        // Fetch the response from Google Maps Distance Matrix API
        Map<String, Object> response = restTemplate.getForObject(uri, Map.class);

        // Extract distance matrix from response
        List<Map<String, Object>> rows = (List<Map<String, Object>>) response.get("rows");
        List<Map<String, Object>> elements = (List<Map<String, Object>>) rows.get(0).get("elements");

        int[][] distanceMatrix = new int[1][elements.size()];
        for (int j = 0; j < elements.size(); j++) {
            Map<String, Object> element = elements.get(j);
            Map<String, Object> distance = (Map<String, Object>) element.get("distance");

            // Safely convert the value to Double first, then to int
            Number distanceValue = (Number) distance.get("value");
            distanceMatrix[0][j] = distanceValue.intValue();
        }
        return distanceMatrix;
    }

    public Map<String, Double[]> getCoordinatesForPlaceIds(List<String> placeIds) {
        Map<String, Double[]> coordinates = new HashMap<>();
        for (String placeId : placeIds) {
            String url = String.format("%s?place_id=%s&fields=geometry&key=%s", GOOGLE_PLACES_API_URL, placeId, apiKey);
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
            if (response != null) {
                Map<String, Object> result = (Map<String, Object>) response.get("result");
                Map<String, Object> geometry = (Map<String, Object>) result.get("geometry");
                Map<String, Double> location = (Map<String, Double>) geometry.get("location");
                Double latitude = location.get("lat");
                Double longitude = location.get("lng");
                coordinates.put(placeId, new Double[]{latitude, longitude});
            }
        }
        return coordinates;
    }
}
