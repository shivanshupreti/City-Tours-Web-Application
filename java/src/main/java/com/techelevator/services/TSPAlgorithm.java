package com.techelevator.services;

import java.util.ArrayList;
import java.util.List;

public class TSPAlgorithm {

    public List<Integer> calculateShortestRoute(int[][] distanceMatrix) {
        int n = distanceMatrix[0].length;
        List<Integer> visited = new ArrayList<>();
        List<Integer> itinerary = new ArrayList<>();
        int start = 0; // Start from the first location

        visited.add(start);
        itinerary.add(start);

        while (visited.size() < n) {
            int nearest = -1;
            int minDistance = Integer.MAX_VALUE;

            for (int i = 0; i < n; i++) {
                if (!visited.contains(i) && distanceMatrix[0][i] < minDistance) {
                    minDistance = distanceMatrix[0][i];
                    nearest = i;
                }
            }

            if (nearest != -1) {
                visited.add(nearest);
                itinerary.add(nearest);
            }
        }

        return itinerary;
    }
}
