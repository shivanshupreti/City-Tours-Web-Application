package com.techelevator.model;

import java.util.Objects;

public class Landmark {
    private int id;
    private String name;
    private String city;
    private String description;
    private String venueType;
    private boolean approvalStatus;
    private String imageUrl;
    private String placeId;
    private int orderNum;

    public Landmark() { }

    public Landmark(int id, String name, String city, String description, String venueType, boolean approvalStatus, String imageUrl, String placeId, int orderNum) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.description = description;
        this.venueType = venueType;
        this.approvalStatus = approvalStatus;
        this.imageUrl = imageUrl;
        this.placeId = placeId;
        this.orderNum = orderNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVenueType() {
        return venueType;
    }

    public void setVenueType(String venueType) {
        this.venueType = venueType;
    }

    public boolean isApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(boolean approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPlaceId() {
        return placeId;
    }

    public void setPlaceId(String placeId) {
        this.placeId = placeId;
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
        Landmark landmark = (Landmark) o;
        return id == landmark.id &&
                approvalStatus == landmark.approvalStatus &&
                orderNum == landmark.orderNum && // Include orderNum in equals check
                Objects.equals(name, landmark.name) &&
                Objects.equals(city, landmark.city) &&
                Objects.equals(description, landmark.description) &&
                Objects.equals(venueType, landmark.venueType) &&
                Objects.equals(imageUrl, landmark.imageUrl) &&
                Objects.equals(placeId, landmark.placeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, city, description, venueType, approvalStatus, imageUrl, placeId, orderNum); // Include orderNum in hashCode
    }

    @Override
    public String toString() {
        return "Landmark{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", description='" + description + '\'' +
                ", venueType='" + venueType + '\'' +
                ", approvalStatus=" + approvalStatus +
                ", imageUrl='" + imageUrl + '\'' +
                ", placeId='" + placeId + '\'' +
                ", orderNum=" + orderNum +
                '}';
    }
}
