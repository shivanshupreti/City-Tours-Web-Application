package com.techelevator.model;

import java.sql.Time;
import java.util.Objects;

public class LandmarkAvailability {
    private int id;
    private int landmarkId;
    private String dayOfWeek;
    private Time openTime;
    private Time closeTime;

    public LandmarkAvailability() { }

    public LandmarkAvailability(int id, int landmarkId, String dayOfWeek, Time openTime, Time closeTime) {
        this.id = id;
        this.landmarkId = landmarkId;
        this.dayOfWeek = dayOfWeek;
        this.openTime = openTime;
        this.closeTime = closeTime;
    }

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

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Time getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Time openTime) {
        this.openTime = openTime;
    }

    public Time getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Time closeTime) {
        this.closeTime = closeTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LandmarkAvailability that = (LandmarkAvailability) o;
        return id == that.id &&
                landmarkId == that.landmarkId &&
                Objects.equals(dayOfWeek, that.dayOfWeek) &&
                Objects.equals(openTime, that.openTime) &&
                Objects.equals(closeTime, that.closeTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, landmarkId, dayOfWeek, openTime, closeTime);
    }

    @Override
    public String toString() {
        return "LandmarkAvailability{" +
                "id=" + id +
                ", landmarkId=" + landmarkId +
                ", dayOfWeek='" + dayOfWeek + '\'' +
                ", openTime=" + openTime +
                ", closeTime=" + closeTime +
                '}';
    }
}

