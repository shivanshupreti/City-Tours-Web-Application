package com.techelevator.model;

import java.util.Objects;

public class ItineraryLandmarks {
    private int itineraryId;
    private int landmarkId;
    private int orderNum;

    public ItineraryLandmarks() {
    }

    public ItineraryLandmarks(int itineraryId, int landmarkId, int orderNum) {
        this.itineraryId = itineraryId;
        this.landmarkId = landmarkId;
        this.orderNum = orderNum;
    }

    public int getItineraryId() {
        return itineraryId;
    }

    public void setItineraryId(int itineraryId) {
        this.itineraryId = itineraryId;
    }

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ItineraryLandmarks that = (ItineraryLandmarks) o;
        return itineraryId == that.itineraryId &&
                landmarkId == that.landmarkId &&
                orderNum == that.orderNum;
    }

    @Override
    public int hashCode() {
        return Objects.hash(itineraryId, landmarkId, orderNum);
    }

    @Override
    public String toString() {
        return "ItineraryLandmarks{" +
                "itineraryId=" + itineraryId +
                ", landmarkId=" + landmarkId +
                ", orderNum=" + orderNum +
                '}';
    }
}
