package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Landmark;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcLandmarkDao implements LandmarkDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcLandmarkDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Landmark getLandmarkById(int id) {
        Landmark landmark = null;
        String sql = "SELECT id, name, city, description, venue_type, approval_status, image_url FROM landmarks WHERE id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                landmark = mapRowToLandmark(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return landmark;
    }

    @Override
    public List<Landmark> getAllLandmarks() {
        List<Landmark> landmarks = new ArrayList<>();
        String sql = "SELECT id, name, city, description, venue_type, approval_status, image_url " +
                "FROM landmarks;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                landmarks.add(mapRowToLandmark(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return landmarks;
    }

    @Override
    public List<Landmark> getLandmarksByCity(String city) {
        List<Landmark> landmarks = new ArrayList<>();
        String sql = "SELECT id, name, city, description, venue_type, approval_status, image_url " +
                "FROM landmarks WHERE city = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, city);
            while (results.next()) {
                landmarks.add(mapRowToLandmark(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return landmarks;
    }

    private Landmark mapRowToLandmark(SqlRowSet rs) {
        Landmark landmark = new Landmark();
        landmark.setId(rs.getInt("id"));
        landmark.setName(rs.getString("name"));
        landmark.setCity(rs.getString("city"));
        landmark.setDescription(rs.getString("description"));
        landmark.setVenueType(rs.getString("venue_type"));
        landmark.setApprovalStatus(rs.getBoolean("approval_status"));
        landmark.setImageUrl(rs.getString("image_url"));
        return landmark;
    }
}

