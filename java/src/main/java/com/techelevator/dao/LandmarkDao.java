package com.techelevator.dao;

import com.techelevator.model.Landmark;

import java.util.List;

public interface LandmarkDao {
    Landmark getLandmarkById(int id);
    List<Landmark> getAllLandmarks();
    List<Landmark> getLandmarksByCity(String city);
}


