package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Popularity;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPopularityDao implements PopularityDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcPopularityDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Popularity> getAllPopularity() {
        List<Popularity> popularityList = new ArrayList<>();
        String sql = "SELECT id, landmark_id, user_id, rating FROM Popularity";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                popularityList.add(mapRowToPopularity(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return popularityList;
    }

    @Override
    public Popularity getPopularityById(Integer id) {
        Popularity popularity = null;
        String sql = "SELECT id, landmark_id, user_id, rating FROM Popularity WHERE id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                popularity = mapRowToPopularity(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return popularity;
    }

    @Override
    public List<Popularity> getPopularityByLandmarkId(Integer landmarkId) {
        List<Popularity> popularityList = new ArrayList<>();
        String sql = "SELECT id, landmark_id, user_id, rating FROM Popularity WHERE landmark_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, landmarkId);
            while (results.next()) {
                popularityList.add(mapRowToPopularity(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return popularityList;
    }

    @Override
    public List<Popularity> getPopularityByUserId(Integer userId) {
        List<Popularity> popularityList = new ArrayList<>();
        String sql = "SELECT id, landmark_id, user_id, rating FROM Popularity WHERE user_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()) {
                popularityList.add(mapRowToPopularity(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return popularityList;
    }

    @Override
    public Popularity addPopularity(Popularity popularity) {
        Popularity newPopularity = null;
        String sql = "INSERT INTO Popularity (landmark_id, user_id, rating) " +
                "VALUES (?, ?, CAST(? AS thumbs)) RETURNING id";
        try {
            int newId = jdbcTemplate.queryForObject(sql, int.class, popularity.getLandmarkId(),
                    popularity.getUserId(), popularity.getRating());
            newPopularity = getPopularityById(newId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return newPopularity;
    }

    @Override
    public int deletePopularityById(Integer id) {
        String sql = "DELETE FROM Popularity WHERE id = ?";
        try {
            return jdbcTemplate.update(sql, id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public int deletePopularityByLandmarkId(Integer landmarkId) {
        String sql = "DELETE FROM Popularity WHERE landmark_id = ?";
        try {
            return jdbcTemplate.update(sql, landmarkId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public int deletePopularityByUserId(Integer userId) {
        String sql = "DELETE FROM Popularity WHERE user_id = ?";
        try {
            return jdbcTemplate.update(sql, userId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public int removePopularityFromLandmark(int landmarkId, int userId) {
        String sql = "DELETE FROM Popularity WHERE landmark_id = ? AND user_id = ?";
        try {
            return jdbcTemplate.update(sql, landmarkId, userId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public int getPopularityCountByLandmarkId(Integer landmarkId) {
        String sql = "SELECT COUNT(*) FROM Popularity WHERE landmark_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, landmarkId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataAccessException e) {
            throw new DaoException("Error accessing data", e);
        }
    }

    private Popularity mapRowToPopularity(SqlRowSet rs) {
        Popularity popularity = new Popularity();
        popularity.setId(rs.getInt("id"));
        popularity.setLandmarkId(rs.getInt("landmark_id"));
        popularity.setUserId(rs.getInt("user_id"));
        popularity.setRating(rs.getString("rating"));
        return popularity;
    }
}
