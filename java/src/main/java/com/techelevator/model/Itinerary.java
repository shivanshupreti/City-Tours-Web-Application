package com.techelevator.model;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
public class Itinerary {
    private Integer id;
    private Integer userId;
    private String name;
    private String startingPoint;
    private LocalDate date;
    private boolean shared;
    private List<Landmark> landmarkList;

    public Itinerary () {}

    public Itinerary(Integer id, Integer userId, String name, String startingPoint, LocalDate date, List<Landmark> landmarkList, boolean shared) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.startingPoint = startingPoint;
        this.date = date;
        this.shared = shared;
        this.landmarkList = landmarkList;
    }

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartingPoint() {
        return startingPoint;
    }

    public void setStartingPoint(String startingPoint) {
        this.startingPoint = startingPoint;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setShared(boolean shared) {
        this.shared = shared;
    }

    public boolean isShared() {
        return shared;
    }

    public List<Landmark> getLandmarkList() {
        return landmarkList;
    }

    public void setLandmarkList(List<Landmark> landmarkList) {
        this.landmarkList = landmarkList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Itinerary)) return false;
        Itinerary itinerary = (Itinerary) o;
        return getId() == itinerary.getId() && getUserId() == itinerary.getUserId() && isShared() == itinerary.isShared() && Objects.equals(getName(), itinerary.getName()) && Objects.equals(getStartingPoint(), itinerary.getStartingPoint()) && Objects.equals(getDate(), itinerary.getDate()) && Objects.equals(getLandmarkList(), itinerary.getLandmarkList());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getName(), getStartingPoint(), getDate(), isShared(), getLandmarkList());
    }

    @Override
    public String toString() {
        return "Itinerary{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", startingPoint='" + startingPoint + '\'' +
                ", date=" + date +
                ", shared=" + shared +
                ", landmarkList=" + landmarkList +
                '}';
    }
}
