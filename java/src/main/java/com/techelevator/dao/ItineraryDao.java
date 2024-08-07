package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.Landmark;

import java.util.List;
public interface ItineraryDao {

    List<Itinerary> getAllItineraries();

    Itinerary getItineraryById(Integer id);

    List<Itinerary> getAllItinerariesById(Integer userId);
    Itinerary createItinerary(Itinerary itinerary, Integer userId);

    Itinerary updateItinerary(Itinerary itinerary, Integer userid, Integer id);
    int deleteItineraryById(Integer Id, Integer userId);

    List<Landmark> getLandmarksByItineraryId(int itineraryId);

    void addLandmarkToItinerary(int itineraryId, int landmarkId, int orderNum);

    void removeLandmarkFromItinerary(int itineraryId, int landmarkId);

    List<Itinerary> getSharedItinerariesByUserId(int userId);

}