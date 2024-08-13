package com.techelevator.model;

import java.util.Objects;

public class StartingPoint {
    private int startingPointId;
    private String startingPointName;

    private String startingPointCity;

    private String startingPointType;

    private String startingPlaceId;

    public StartingPoint() {}

    public StartingPoint(int startingPointId, String startingPointName, String startingPointCity, String startingPointType, String startingPlaceId) {
        this.startingPointId = startingPointId;
        this.startingPointName = startingPointName;
        this.startingPointCity = startingPointCity;
        this.startingPointType = startingPointType;
        this.startingPlaceId = startingPlaceId;
    }

    public int getStartingPointId() {
        return startingPointId;
    }

    public void setStartingPointId(int startingPointId) {
        this.startingPointId = startingPointId;
    }

    public String getStartingPointName() {
        return startingPointName;
    }

    public void setStartingPointName(String startingPointName) {
        this.startingPointName = startingPointName;
    }

    public String getStartingPointCity() {
        return startingPointCity;
    }

    public void setStartingPointCity(String startingPointCity) {
        this.startingPointCity = startingPointCity;
    }

    public String getStartingPointType() {
        return startingPointType;
    }

    public void setStartingPointType(String startingPointType) {
        this.startingPointType = startingPointType;
    }

    public String getStartingPlaceId() {
        return startingPlaceId;
    }

    public void setStartingPlaceId(String startingPlaceId) {
        this.startingPlaceId = startingPlaceId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StartingPoint)) return false;
        StartingPoint that = (StartingPoint) o;
        return getStartingPointId() == that.getStartingPointId() && Objects.equals(getStartingPointName(), that.getStartingPointName()) && Objects.equals(getStartingPointCity(), that.getStartingPointCity()) && Objects.equals(getStartingPointType(), that.getStartingPointType()) && Objects.equals(getStartingPlaceId(), that.getStartingPlaceId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getStartingPointId(), getStartingPointName(), getStartingPointCity(), getStartingPointType(), getStartingPlaceId());
    }

    @Override
    public String toString() {
        return "StartingPoints{" +
                "startingPointId=" + startingPointId +
                ", startingPointName='" + startingPointName + '\'' +
                ", startingPointCity='" + startingPointCity + '\'' +
                ", startingPointType='" + startingPointType + '\'' +
                ", startingPlaceId='" + startingPlaceId + '\'' +
                '}';
    }
}
