package com.techelevator.model;

import java.time.LocalDateTime;
import java.util.Objects;

public class Review {
    private int id;
    private int landmarkId;
    private int userId;
    private String firstName;
    private String lastName;
    private String title;
    private int rating;
    private String description;
    private LocalDateTime createdAt;
    private boolean approvalStatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLandmarkId() {
        return landmarkId;
    }

    public void setLandmarkId(int landmarkId) {
        this.landmarkId = landmarkId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(boolean approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Review review = (Review) o;
        return id == review.id &&
                landmarkId == review.landmarkId &&
                userId == review.userId &&
                rating == review.rating &&
                approvalStatus == review.approvalStatus &&
                Objects.equals(firstName, review.firstName) &&
                Objects.equals(lastName, review.lastName) &&
                Objects.equals(title, review.title) &&
                Objects.equals(description, review.description) &&
                Objects.equals(createdAt, review.createdAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, landmarkId, userId, firstName, lastName, title, rating, description, createdAt, approvalStatus);
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", landmarkId=" + landmarkId +
                ", userId=" + userId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", title='" + title + '\'' +
                ", rating=" + rating +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                ", approvalStatus=" + approvalStatus +
                '}';
    }
}
