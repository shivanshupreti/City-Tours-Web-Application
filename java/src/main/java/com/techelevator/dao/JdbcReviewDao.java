package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Popularity;
import com.techelevator.model.Review;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Review> getAllReviews() {
        String sql = "SELECT id, landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status " +
                "FROM reviews";
        try {
            return jdbcTemplate.query(sql, new ReviewRowMapper());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while retrieving all reviews", e);
        }
    }

    @Override
    public List<Review> getAllApprovedReviews() {
        String sql = "SELECT id, landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status " +
                "FROM reviews WHERE approval_status = TRUE";
        try {
            return jdbcTemplate.query(sql, new ReviewRowMapper());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while retrieving approved reviews", e);
        }
    }

    @Override
    public List<Review> getAllDisapprovedReviews() {
        String sql = "SELECT id, landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status " +
                "FROM reviews WHERE approval_status = FALSE";
        try {
            return jdbcTemplate.query(sql, new ReviewRowMapper());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while retrieving disapproved reviews", e);
        }
    }

    @Override
    public Review getReviewById(int id) {
        String sql = "SELECT id, landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status " +
                "FROM reviews WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new ReviewRowMapper(), id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while retrieving review with id " + id, e);
        }
    }

    @Override
    public Review createReview(Review review) {
        Review newReview = null;
        String sql = "INSERT INTO reviews (landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id";
        try {
            int newId = jdbcTemplate.queryForObject(sql, int.class, review.getLandmarkId(), review.getUserId(),
                    review.getFirstName(), review.getLastName(), review.getTitle(),
                    review.getRating(), review.getDescription(), review.getCreatedAt(),
                    review.isApprovalStatus());
            newReview = getReviewById(newId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while creating review", e);
        }
        return newReview;
    }

    @Override
    public Review updateReview(Review review) {
        String sql = "UPDATE reviews SET landmark_id = ?, user_id = ?, first_name = ?, last_name = ?, title = ?, rating = ?, " +
                "description = ?, created_at = ?, approval_status = ? WHERE id = ?";
        try {
            jdbcTemplate.update(sql, review.getLandmarkId(), review.getUserId(), review.getFirstName(), review.getLastName(),
                    review.getTitle(), review.getRating(), review.getDescription(), review.getCreatedAt(),
                    review.isApprovalStatus(), review.getId());
            return review;
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while updating review with id " + review.getId(), e);
        }
    }

    @Override
    public void deleteReview(int id) {
        String sql = "DELETE FROM reviews WHERE id = ?";
        try {
            jdbcTemplate.update(sql, id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while deleting review with id " + id, e);
        }
    }

    @Override
    public Double getAverageRatingByLandmarkId(int landmarkId) {
        String sql = "SELECT AVG(rating) FROM reviews WHERE landmark_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, Double.class, landmarkId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while calculating average rating for landmark with id " + landmarkId, e);
        }
    }

    @Override
    public List<Review> getApprovedReviewsByLandmarkId(int landmarkId) {
        String sql = "SELECT id, landmark_id, user_id, first_name, last_name, title, rating, description, created_at, approval_status " +
                "FROM reviews WHERE approval_status = TRUE AND landmark_id = ? " +
                "ORDER BY created_at DESC";
        try {
            return jdbcTemplate.query(sql, new ReviewRowMapper(), landmarkId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation occurred while retrieving approved reviews for landmark with id " + landmarkId, e);
        }
    }

    private static final class ReviewRowMapper implements RowMapper<Review> {
        @Override
        public Review mapRow(ResultSet rs, int rowNum) throws SQLException {
            Review review = new Review();
            review.setId(rs.getInt("id"));
            review.setLandmarkId(rs.getInt("landmark_id"));
            review.setUserId(rs.getInt("user_id"));
            review.setFirstName(rs.getString("first_name"));
            review.setLastName(rs.getString("last_name"));
            review.setTitle(rs.getString("title"));
            review.setRating(rs.getInt("rating"));
            review.setDescription(rs.getString("description"));
            review.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            review.setApprovalStatus(rs.getBoolean("approval_status"));
            return review;
        }
    }
}
