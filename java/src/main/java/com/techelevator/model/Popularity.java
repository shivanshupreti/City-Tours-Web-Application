package com.techelevator.model;

import java.util.Objects;

public class Popularity {
    private Integer id;
    private Integer landmarkId;
    private Integer userId;
    private String rating;

    public Popularity() {}

    public Popularity(Integer id, Integer landmarkId, Integer userId, String rating) {
        this.id = id;
        this.landmarkId = landmarkId;
        this.userId = userId;
        this.rating = rating;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(Integer landmarkId) {
        this.landmarkId = landmarkId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Popularity)) return false;
        Popularity that = (Popularity) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(landmarkId, that.landmarkId) &&
                Objects.equals(userId, that.userId) &&
                Objects.equals(rating, that.rating);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, landmarkId, userId, rating);
    }

    @Override
    public String toString() {
        return "Popularity{" +
                "id=" + id +
                ", landmarkId=" + landmarkId +
                ", userId=" + userId +
                ", rating='" + rating + '\'' +
                '}';
    }
}
