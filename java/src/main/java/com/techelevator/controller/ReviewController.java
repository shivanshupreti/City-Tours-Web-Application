package com.techelevator.controller;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Review;
import com.techelevator.dao.ReviewDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/reviews")
public class ReviewController {

    private final ReviewDao reviewDao;

    public ReviewController(ReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }

    @RequestMapping(path = "", method = RequestMethod.GET)
    public List<Review> getAllReviews() {
        try {
            return reviewDao.getAllReviews();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to retrieve reviews", e);
        }
    }

    @RequestMapping(path = "/approved", method = RequestMethod.GET)
    public List<Review> getAllApprovedReviews() {
        try {
            return reviewDao.getAllApprovedReviews();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to retrieve approved reviews", e);
        }
    }

    @RequestMapping(path = "/disapproved", method = RequestMethod.GET)
    public List<Review> getAllDisapprovedReviews() {
        try {
            return reviewDao.getAllDisapprovedReviews();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to retrieve disapproved reviews", e);
        }
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Review getReviewById(@PathVariable int id) {
        try {
            return reviewDao.getReviewById(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Review not found", e);
        }
    }

    @RequestMapping(path = "/new", method = RequestMethod.POST)
    public Review createReview(@RequestBody Review review) {
        try {
            return reviewDao.createReview(review);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to create review", e);
        }
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public Review updateReview(@PathVariable int id, @RequestBody Review review) {
        try {
            review.setId(id);
            return reviewDao.updateReview(review);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to update review", e);
        }
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    public void deleteReview(@PathVariable int id) {
        try {
            reviewDao.deleteReview(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to delete review", e);
        }
    }

    @RequestMapping(path = "/average-rating/{landmarkId}", method = RequestMethod.GET)
    public Double getAverageRatingByLandmarkId(@PathVariable int landmarkId) {
        try {
            return reviewDao.getAverageRatingByLandmarkId(landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to calculate average rating", e);
        }
    }

    @RequestMapping(path = "/approved/{landmarkId}", method = RequestMethod.GET)
    public List<Review> getApprovedReviewsByLandmarkId(@PathVariable int landmarkId) {
        try {
            return reviewDao.getApprovedReviewsByLandmarkId(landmarkId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Unable to retrieve approved reviews for landmark with id " + landmarkId, e);
        }
    }
}
