package com.techelevator.controller;
import com.techelevator.dao.ItineraryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.*;
import com.techelevator.services.DistanceMatrixService;
import com.techelevator.services.TSPAlgorithm;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.nio.file.Path;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@CrossOrigin
@RequestMapping("/itineraries")
@PreAuthorize("isAuthenticated()")
public class ItineraryController {
    private final ItineraryDao itineraryDao;
    private final UserDao userDao;
    private DistanceMatrixService distanceMatrixService;


    public ItineraryController(ItineraryDao itineraryDao, UserDao userDao, DistanceMatrixService distanceMatrixService) {
        this.itineraryDao = itineraryDao;
        this.userDao = userDao;
        this.distanceMatrixService = distanceMatrixService;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Itinerary> getAllItineraries() {
        try {
            return itineraryDao.getAllItineraries();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Itinerary getItineraryById(@PathVariable Integer id){
        Itinerary itinerary;
        try {
            itinerary = itineraryDao.getItineraryById(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return itinerary;
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/new", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public Itinerary createItinerary (@RequestBody Itinerary itinerary, Principal principal){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();
        return itineraryDao.createItinerary(itinerary, userId);
    }
    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/yourItineraries", method = RequestMethod.GET)
    public List<Itinerary> getAllItinerariesById(Principal principal){
        List<Itinerary> itineraries;
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();
        try {
            itineraries = itineraryDao.getAllItinerariesById(userId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return itineraries;
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/deleteItinerary/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public int deleteItineraryById(@PathVariable Integer id, Principal principal ){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();
        return itineraryDao.deleteItineraryById(id,userId);
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/update/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.OK)
    public Itinerary updateItinerary (@RequestBody Itinerary updatedItinerary, @PathVariable Integer id, Principal principal){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();

        return itineraryDao.updateItinerary(updatedItinerary, userId, id);
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/{itineraryId}/add-landmarks", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void addLandmarkToItinerary(@RequestBody ItineraryLandmarks itineraryLandmarks) {
        try {
            itineraryDao.addLandmarkToItinerary(itineraryLandmarks.getItineraryId(), itineraryLandmarks.getLandmarkId(), itineraryLandmarks.getOrderNum());
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/{itineraryId}/landmarks/{landmarkId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeLandmarkFromItinerary(@PathVariable int itineraryId, @PathVariable int landmarkId) {
        try {
            itineraryDao.removeLandmarkFromItinerary(itineraryId, landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/shared/{id}", method = RequestMethod.GET)
    public Itinerary getSharedItineraryById(@PathVariable Integer id) {
        Itinerary itinerary = itineraryDao.getItineraryById(id);
        if (itinerary.isShared()) {
            return itinerary;
        } else {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "This itinerary is private.");
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/{itineraryId}/landmarks", method = RequestMethod.GET)
    public List<Landmark> getLandmarksByItineraryId(@PathVariable int itineraryId) {
        try {
            return itineraryDao.getLandmarksByItineraryId(itineraryId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/startingpoints/{city}", method = RequestMethod.GET)
    public List<StartingPoint> getStartingPointsByCity(@PathVariable String city){
        return itineraryDao.getStartingPointsByCity(city);
    }

    @GetMapping("/startingpoint-place-id")
    public String getStartingPlaceIdByName(@RequestParam String startingPointName) {
        try {
            String placeId = itineraryDao.getStartingPlaceIdByName(startingPointName);
            if (placeId != null) {
                return placeId;
            } else {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Starting place not found");
            }
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "An error occurred while retrieving the place ID", e);
        }
    }


    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @GetMapping("/api/itinerary")
    public Map<String, Object> getItinerary(
            @RequestParam String origin,
            @RequestParam List<String> destinations
    ) {
        // Add the origin to the list of destinations for the matrix calculation
        List<String> allPlaces = new ArrayList<>();
        allPlaces.add(origin);
        allPlaces.addAll(destinations);

        // Call the service to get the distance matrix including origin
        int[][] distanceMatrix = distanceMatrixService.getDistanceMatrix(origin, allPlaces);

        // Remove the origin from the route order and set it at the start
        TSPAlgorithm tspAlgorithm = new TSPAlgorithm();
        List<Integer> routeOrder = tspAlgorithm.calculateShortestRoute(distanceMatrix);

        // Create the itinerary based on the route order, starting with the origin
        List<String> orderedDestinations = routeOrder.stream()
                .map(index -> allPlaces.get(index))
                .collect(Collectors.toList());

        // Get coordinates for the destinations in the order determined by TSP
        Map<String, Double[]> coordinatesMap = distanceMatrixService.getCoordinatesForPlaceIds(allPlaces);

        // Reorder the coordinates based on the itinerary
        List<Double[]> orderedCoordinates = orderedDestinations.stream()
                .map(coordinatesMap::get)
                .collect(Collectors.toList());

        // Create response with itinerary and coordinates
        Map<String, Object> response = new HashMap<>();
        response.put("itinerary", orderedDestinations); // List of place IDs in order, including origin
        response.put("coordinates", orderedCoordinates); // List of coordinates in order, including origin

        return response;
    }
}
