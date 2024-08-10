package com.techelevator.dao;

import com.techelevator.model.Popularity;

import java.util.List;

public interface PopularityDao {

    List<Popularity> getAllPopularity();

    Popularity getPopularityById(Integer id);

    List<Popularity> getPopularityByLandmarkId(Integer landmarkId);

    List<Popularity> getPopularityByUserId(Integer userId);

    Popularity addPopularity(Popularity popularity);

    int deletePopularityById(Integer id);

    int deletePopularityByLandmarkId(Integer landmarkId);

    int deletePopularityByUserId(Integer userId);

    int removePopularityFromLandmark(int landmarkId, int userId);

    int getPopularityCountByLandmarkId(Integer landmarkId);
}
