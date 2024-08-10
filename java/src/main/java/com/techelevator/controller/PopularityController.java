package com.techelevator.controller;

import com.techelevator.dao.PopularityDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Popularity;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/popularity")
public class PopularityController {
    private final PopularityDao popularityDao;

    public PopularityController(PopularityDao popularityDao) {
        this.popularityDao = popularityDao;
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Popularity> getAllPopularity() {
        try {
            return popularityDao.getAllPopularity();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Popularity getPopularityById(@PathVariable Integer id) {
        Popularity popularity;
        try {
            popularity = popularityDao.getPopularityById(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return popularity;
    }

    @RequestMapping(path = "/landmark/{landmarkId}", method = RequestMethod.GET)
    public List<Popularity> getPopularityByLandmarkId(@PathVariable Integer landmarkId) {
        try {
            return popularityDao.getPopularityByLandmarkId(landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(path = "/user/{userId}", method = RequestMethod.GET)
    public List<Popularity> getPopularityByUserId(@PathVariable Integer userId) {
        try {
            return popularityDao.getPopularityByUserId(userId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public Popularity addPopularity(@RequestBody Popularity popularity) {
        try {
            return popularityDao.addPopularity(popularity);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePopularityById(@PathVariable Integer id) {
        try {
            int rowsDeleted = popularityDao.deletePopularityById(id);
            if (rowsDeleted == 0) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Popularity not found");
            }
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/landmark/{landmarkId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePopularityByLandmarkId(@PathVariable Integer landmarkId) {
        try {
            int rowsDeleted = popularityDao.deletePopularityByLandmarkId(landmarkId);
            if (rowsDeleted == 0) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Popularity for landmark not found");
            }
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/user/{userId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePopularityByUserId(@PathVariable Integer userId) {
        try {
            int rowsDeleted = popularityDao.deletePopularityByUserId(userId);
            if (rowsDeleted == 0) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Popularity for user not found");
            }
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/count/{landmarkId}", method = RequestMethod.GET)
    public int getPopularityCountByLandmarkId(@PathVariable Integer landmarkId) {
        try {
            return popularityDao.getPopularityCountByLandmarkId(landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/remove/{landmarkId}/{userId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removePopularityFromLandmark(@PathVariable Integer landmarkId, @PathVariable Integer userId) {
        try {
            int rowsDeleted = popularityDao.removePopularityFromLandmark(landmarkId, userId);
            if (rowsDeleted == 0) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Popularity record not found for landmark and user");
            }
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, e.getMessage(), e);
        }
    }
}
