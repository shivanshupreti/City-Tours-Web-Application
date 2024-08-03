package com.techelevator.controller;

import com.techelevator.dao.LandmarkAvailabilityDao;
import com.techelevator.dao.LandmarkDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Landmark;
import com.techelevator.model.LandmarkAvailability;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/landmarks")
//@PreAuthorize("isAuthenticated()")
public class LandmarkController {
    private final LandmarkDao landmarkDao;
    private final LandmarkAvailabilityDao landmarkAvailabilityDao;

    public LandmarkController(LandmarkDao landmarkDao, LandmarkAvailabilityDao landmarkAvailabilityDao) {
        this.landmarkDao = landmarkDao;
        this.landmarkAvailabilityDao = landmarkAvailabilityDao;
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Landmark> getAllLandmarks() {
        List<Landmark> landmarks;
        try {
            landmarks = landmarkDao.getAllLandmarks();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return landmarks;
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Landmark getLandmark(@PathVariable int id) {
        Landmark landmark;
        try {
            landmark = landmarkDao.getLandmarkById(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return landmark;
    }

    @RequestMapping(path = "/city/{city}", method = RequestMethod.GET)
    public List<Landmark> getLandmarksByCity(@PathVariable String city) {
        List<Landmark> landmarks;
        try {
            landmarks = landmarkDao.getLandmarksByCity(city);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return landmarks;
    }

    @RequestMapping(path = "/availability/{landmarkId}", method = RequestMethod.GET)
    public List<LandmarkAvailability> getAvailabilityByLandmarkId(@PathVariable int landmarkId) {
        List<LandmarkAvailability> availabilityList;
        try {
            availabilityList = landmarkAvailabilityDao.getAvailabilityByLandmarkId(landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return availabilityList;
    }

    @RequestMapping(path = "/availability/landmark/{landmarkName}", method = RequestMethod.GET)
    public List<LandmarkAvailability> getAvailabilityByLandmarkName(@PathVariable String landmarkName) {
        List<LandmarkAvailability> availabilityList;
        try {
            availabilityList = landmarkAvailabilityDao.getAvailabilityByLandmarkName(landmarkName);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return availabilityList;
    }

    @RequestMapping(path = "/availability/landmark/{landmarkName}/{dayOfWeek}", method = RequestMethod.GET)
    public List<LandmarkAvailability> getAvailabilityByLandmarkNameAndDayOfWeek(@PathVariable String landmarkName, @PathVariable String dayOfWeek) {
        List<LandmarkAvailability> availabilityList;
        try {
            availabilityList = landmarkAvailabilityDao.getAvailabilityByLandmarkNameAndDayOfWeek(landmarkName, dayOfWeek);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return availabilityList;
    }
}


