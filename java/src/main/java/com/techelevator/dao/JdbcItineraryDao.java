package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Itinerary;
import com.techelevator.model.Landmark;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcItineraryDao implements ItineraryDao{
    private final JdbcTemplate jdbcTemplate;
    private final LandmarkDao landmarkDao;

    public JdbcItineraryDao(JdbcTemplate jdbcTemplate, LandmarkDao landmarkDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.landmarkDao = landmarkDao;
    }

    @Override
    public List<Itinerary> getAllItineraries() {
        List<Itinerary> itineraries = new ArrayList<>();
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM Itineraries";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Itinerary itinerary = mapRowToItinerary(results);
                itinerary.setLandmarkList(getLandmarksByItineraryId(itinerary.getId()));
                itineraries.add(itinerary);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return itineraries;
    }

    @Override
    public Itinerary getItineraryById(Integer id){
        Itinerary itinerary = null;
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM itineraries WHERE id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()){
                itinerary = mapRowToItinerary(results);
                itinerary.setLandmarkList(getLandmarksByItineraryId(id));
            }
        }catch (CannotGetJdbcConnectionException e){
            throw new DaoException("unable to connect to the server or database", e);
        }
        return itinerary;
    }
    @Override
    public List <Itinerary>  getAllItinerariesById(Integer userId){
        List<Itinerary> itineraryList = new ArrayList<>();
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM itineraries WHERE user_id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()){
                Itinerary itinerary = mapRowToItinerary(results);
                itinerary.setLandmarkList(getLandmarksByItineraryId(itinerary.getId()));
                itineraryList.add(itinerary);
            }
        }catch (CannotGetJdbcConnectionException e){
            throw new DaoException("unable to connect to the server or database", e);
        }
        return itineraryList;
    }
    @Override
    public Itinerary createItinerary(Itinerary itinerary, Integer userId) {
        Itinerary newItinerary;
        String sql = "INSERT INTO itineraries(user_id, name, starting_point, date, shared_status) VALUES (?, ?, ?, ?, ?) RETURNING id";
        try {
            Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, userId, itinerary.getName(), itinerary.getStartingPoint(), itinerary.getDate(), itinerary.isShared());
            if (newId != null) {
                itinerary.setId(newId);
                List<Landmark> landmarkList = itinerary.getLandmarkList();
                if (landmarkList != null) {
                    for (Landmark landmark : landmarkList) {
                        addLandmarkToItinerary(newId, landmark.getId(), landmark.getOrderNum());
                    }
                }

                newItinerary = getItineraryById(newId);
            } else {
                throw new DaoException("Failed to retrieve Id");
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to the server or database", e);
        }
        return newItinerary;
    }

    @Override
    public Itinerary updateItinerary(Itinerary itinerary, Integer userID, Integer id) {
        Itinerary newItinerary = null;
        String sql = "UPDATE itineraries SET name = ?, starting_point = ?, date = ?, shared_status = ? WHERE id = ? AND user_id = ?;";

        try {
            int numberOfRows = jdbcTemplate.update(sql, itinerary.getName(), itinerary.getStartingPoint(), itinerary.getDate(), itinerary.isShared(),
                    id, userID);

            if (numberOfRows == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            }
            removeLandmarksFromItinerary(id);
            if (itinerary.getLandmarkList() != null) {
                for (Landmark landmark : itinerary.getLandmarkList()) {
                    addLandmarkToItinerary(id, landmark.getId(), landmark.getOrderNum());
                }
            }
            newItinerary = getItineraryById(id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return newItinerary;
    }

    @Override
    public int deleteItineraryById(Integer id, Integer userId){
        int numOfRows = 0;
        String deleteItineraryLandmarksSql = "DELETE FROM ItineraryLandmarks WHERE itinerary_id = ?";
        String sql = "DELETE FROM itineraries where id = ? AND user_id = ?";
        try {
            jdbcTemplate.update(deleteItineraryLandmarksSql, id);
            jdbcTemplate.update(sql, id, userId);
            numOfRows = jdbcTemplate.update(sql, id, userId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to the server or database", e);
        }catch(DataIntegrityViolationException e){
            throw new DaoException("Data Integrity Violation");
        }
        return numOfRows;
    }

    @Override
    public List<Landmark> getLandmarksByItineraryId(int itineraryId) {
        List<Landmark> landmarks = new ArrayList<>();
        String sql = "SELECT landmark_id FROM ItineraryLandmarks WHERE itinerary_id = ? ORDER BY order_num";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, itineraryId);
            while (results.next()) {
                int landmarkId = results.getInt("landmark_id");
                Landmark landmark = landmarkDao.getLandmarkById(landmarkId);
                if (landmark != null) {
                    landmarks.add(landmark);
                }
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return landmarks;
    }

    @Override
    public void addLandmarkToItinerary(int itineraryId, int landmarkId, int orderNum) {
        String sql = "INSERT INTO ItineraryLandmarks (itinerary_id, landmark_id, order_num) VALUES (?, ?, ?)";
        try {
            jdbcTemplate.update(sql, itineraryId, landmarkId, orderNum);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public void removeLandmarkFromItinerary(int itineraryId, int landmarkId) {
        String sql = "DELETE FROM ItineraryLandmarks WHERE itinerary_id = ? AND landmark_id = ?";
        try {
            jdbcTemplate.update(sql, itineraryId, landmarkId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }

    @Override
    public List<Itinerary> getSharedItinerariesByUserId(int userId) {
        List<Itinerary> itineraries = new ArrayList<>();
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM Itineraries WHERE user_id = ? AND shared_status = true";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()) {
                Itinerary itinerary = mapRowToItinerary(results);
                itinerary.setLandmarkList(getLandmarksByItineraryId(itinerary.getId()));
                itineraries.add(itinerary);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return itineraries;
    }

    public void removeLandmarksFromItinerary(int itineraryId) {
        String sql = "DELETE FROM itinerarylandmarks WHERE itinerary_id = ?;";
        jdbcTemplate.update(sql, itineraryId);
    }

    private Itinerary mapRowToItinerary(SqlRowSet rs){
        Itinerary itinerary = new Itinerary();
        itinerary.setId(rs.getInt("id"));
        itinerary.setUserId(rs.getInt("user_id"));
        itinerary.setName(rs.getString("name"));
        itinerary.setStartingPoint(rs.getString("starting_point"));
        itinerary.setDate(rs.getDate("date").toLocalDate());
        itinerary.setShared(rs.getBoolean("shared_status"));
        return itinerary;
    }
}
