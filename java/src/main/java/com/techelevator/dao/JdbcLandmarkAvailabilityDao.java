package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.LandmarkAvailability;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcLandmarkAvailabilityDao implements LandmarkAvailabilityDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcLandmarkAvailabilityDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<LandmarkAvailability> getAvailabilityByLandmarkId(int landmarkId) {
        List<LandmarkAvailability> availabilities = new ArrayList<>();
        String sql = "SELECT id, landmark_id, day_of_week, open_time, close_time " +
                "FROM landmarkavailability WHERE landmark_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, landmarkId);
            while (results.next()) {
                availabilities.add(mapRowToLandmarkAvailability(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return availabilities;
    }

    @Override
    public List<LandmarkAvailability> getAvailabilityByLandmarkName(String name) {
        List<LandmarkAvailability> availabilities = new ArrayList<>();
        String sql = "SELECT la.id, la.landmark_id, la.day_of_week, la.open_time, la.close_time " +
                "FROM landmarkavailability la " +
                "JOIN landmarks l ON la.landmark_id = l.id " +
                "WHERE l.name = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
            while (results.next()) {
                availabilities.add(mapRowToLandmarkAvailability(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return availabilities;
    }

    @Override
    public List<LandmarkAvailability> getAvailabilityByLandmarkNameAndDayOfWeek(String name, String dayOfWeek) {
        List<LandmarkAvailability> availabilities = new ArrayList<>();
        String sql = "SELECT la.id, la.landmark_id, la.day_of_week, la.open_time, la.close_time " +
                "FROM landmarkavailability la " +
                "JOIN landmarks l ON la.landmark_id = l.id " +
                "WHERE l.name = ? AND la.day_of_week = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name, dayOfWeek);
            while (results.next()) {
                availabilities.add(mapRowToLandmarkAvailability(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return availabilities;
    }

    private LandmarkAvailability mapRowToLandmarkAvailability(SqlRowSet rs) {
        LandmarkAvailability availability = new LandmarkAvailability();
        availability.setId(rs.getInt("id"));
        availability.setLandmarkId(rs.getInt("landmark_id"));
        availability.setDayOfWeek(rs.getString("day_of_week"));
        availability.setOpenTime(rs.getTime("open_time"));
        availability.setCloseTime(rs.getTime("close_time"));
        return availability;
    }
}
