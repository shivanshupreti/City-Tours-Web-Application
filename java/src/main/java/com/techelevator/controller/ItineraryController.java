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
import java.util.List;
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
    @RequestMapping(path = "/{itineraryId}/landmarks", method = RequestMethod.GET)
    public List<Landmark> getLandmarksByItineraryId(@PathVariable int itineraryId) {
        try {
            return itineraryDao.getLandmarksByItineraryId(itineraryId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/sharedItineraries", method = RequestMethod.GET)
    public List<Itinerary> getSharedItinerariesByUserId(Principal principal) {
        int userId = userDao.getUserByUsername(principal.getName()).getId();
        try {
            return itineraryDao.getSharedItinerariesByUserId(userId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/startingpoints/{city}", method = RequestMethod.GET)
    public List<StartingPoint> getStartingPointsByCity(@PathVariable String city){
        return itineraryDao.getStartingPointsByCity(city);
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @GetMapping("/api/itinerary")
    public List<String> getItinerary(
            @RequestParam String origin,
            @RequestParam List<String> destinations
    ) {
        // Call the service to get the distance matrix
        int[][] distanceMatrix = distanceMatrixService.getDistanceMatrix(origin, destinations);
        TSPAlgorithm tspAlgorithm = new TSPAlgorithm();
        List<Integer> routeOrder = tspAlgorithm.calculateShortestRoute(distanceMatrix);

        // Create the itinerary based on the route order
        List<String> itinerary = routeOrder.stream()
                .map(destinations::get)
                .collect(Collectors.toList());

        return itinerary;
    }
}
