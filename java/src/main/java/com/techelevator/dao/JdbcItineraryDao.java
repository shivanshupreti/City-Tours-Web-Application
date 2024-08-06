package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Itinerary;
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

    public JdbcItineraryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Itinerary getItineraryById(Integer id){
        Itinerary itinerary = null;
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM itineraries WHERE id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()){
                itinerary = mapRowToItinerary(results);
            }
        }catch (CannotGetJdbcConnectionException e){
            throw new DaoException("unable to connect to the server or database", e);
        }
        return itinerary;
    }
    @Override
    public List <Itinerary>  getAllItineraries(Integer userId){
        List<Itinerary> itineraryList = new ArrayList<>();
        String sql = "SELECT id, user_id, name, starting_point, date, shared_status FROM itineraries WHERE user_id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()){
                itineraryList.add(mapRowToItinerary(results));
            }
        }catch (CannotGetJdbcConnectionException e){
            throw new DaoException("unable to connect to the server or database", e);
        }
        return itineraryList;
    }
    @Override
    public Itinerary createItinerary(Itinerary itinerary, Integer userId){
        Itinerary newItinerary;
        String sql = "INSERT INTO itineraries(user_id, name, starting_point, date, shared_status) VALUES (?, ?, ?, ?, ?) RETURNING id";
        try {
            Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, userId, itinerary.getName(), itinerary.getStartingPoint(), itinerary.getDate(), itinerary.isShared());
            if(newId != null) {
                itinerary.setId(newId);
            }else {
                throw new DaoException("Failed to retrieve Id");
            }
            newItinerary = getItineraryById(newId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new  DaoException("unable to connect to the server or database", e);
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

            if(numberOfRows == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            } else {
                newItinerary = getItineraryById(itinerary.getId());
            }
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
        String sql = "DELETE FROM itineraries where id = ? AND user_id = ?";
        try {
            jdbcTemplate.update(sql, id, userId);
            numOfRows = jdbcTemplate.update(sql, id, userId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to the server or database", e);
        }catch(DataIntegrityViolationException e){
            throw new DaoException("Data Integrity Violation");
        }
        return numOfRows;
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
