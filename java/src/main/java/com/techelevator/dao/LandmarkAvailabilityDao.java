package com.techelevator.dao;

import com.techelevator.model.LandmarkAvailability;

import java.util.List;

public interface LandmarkAvailabilityDao {
    List<LandmarkAvailability> getAvailabilityByLandmarkId(int landmarkId);
    List<LandmarkAvailability> getAvailabilityByLandmarkName(String name);
    List<LandmarkAvailability> getAvailabilityByLandmarkNameAndDayOfWeek(String name, String dayOfWeek);
}


