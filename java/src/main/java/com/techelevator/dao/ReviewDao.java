package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {
    List<Review> getAllReviews();
    List<Review> getAllApprovedReviews();
    List<Review> getAllDisapprovedReviews();
    Review getReviewById(int id);
    Review createReview(Review review);
    Review updateReview(Review review);
    void deleteReview(int id);
    Double getAverageRatingByLandmarkId(int landmarkId);
    List<Review> getApprovedReviewsByLandmarkId(int landmarkId);
}
