package com.techelevator.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DistanceMatrixService {
    private static final String GOOGLE_MAPS_API_URL = "https://maps.googleapis.com/maps/api/distancematrix/json";

    @Value("${google.maps.api.key}")
    private String apiKey;

    public int[][] getDistanceMatrix(String origin, List<String> destinations) {
        // Prepend 'place_id:' to origin and each destination
        String formattedOrigin = "place_id:" + origin;
        String formattedDestinations = destinations.stream()
                .map(id -> "place_id:" + id)
                .collect(Collectors.joining("|"));

        URI uri = UriComponentsBuilder.fromHttpUrl(GOOGLE_MAPS_API_URL)
                .queryParam("origins", formattedOrigin)
                .queryParam("destinations", formattedDestinations)
                .queryParam("key", apiKey)
                .build().toUri();

        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> response = restTemplate.getForObject(uri, Map.class);

        List<Map<String, Object>> rows = (List<Map<String, Object>>) response.get("rows");
        List<Map<String, Object>> elements = (List<Map<String, Object>>) rows.get(0).get("elements");

        int[][] distanceMatrix = new int[1][elements.size()];
        for (int j = 0; j < elements.size(); j++) {
            Map<String, Object> distance = (Map<String, Object>) elements.get(j).get("distance");
            distanceMatrix[0][j] = (int) distance.get("value");
        }
        return distanceMatrix;
    }
}
