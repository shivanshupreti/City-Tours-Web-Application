package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.util.List;
public interface ItineraryDao {

    Itinerary getItineraryById(Integer id);

    List<Itinerary> getAllItineraries(Integer userId);
    Itinerary createItinerary(Itinerary itinerary, Integer userId);

    //Itinerary updateItinerary(Itinerary itinerary);
    int deleteItineraryById(Integer Id, Integer userId);
}
