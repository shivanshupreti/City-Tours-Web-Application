package com.techelevator.controller;
import com.techelevator.dao.ItineraryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Itinerary;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/itinerary")
@PreAuthorize("isAuthenticated()")
public class ItineraryController {
    private final ItineraryDao itineraryDao;
    private final UserDao userDao;


    public ItineraryController(ItineraryDao itineraryDao, UserDao userDao) {
        this.itineraryDao = itineraryDao;
        this.userDao = userDao;
    }
    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Itinerary getItineraryById(@PathVariable Integer id){
        Itinerary itinerary;
        try {
            itinerary = itineraryDao.getItineraryById(id);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return itinerary;
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/new", method = RequestMethod.POST)
    public Itinerary createItinerary (@RequestBody Itinerary itinerary, Principal principal){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();

        return itineraryDao.createItinerary(itinerary, userId);
    }
    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/yourItineraries/{id}", method = RequestMethod.GET)
    public List<Itinerary> getAllItinerariesById(Principal principal){
        List<Itinerary> itineraries;
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();
        try {
            itineraries = itineraryDao.getAllItinerariesById(userId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return itineraries;
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/deleteItinerary/{id}", method = RequestMethod.DELETE)
    public int deleteItineraryById(@PathVariable Integer id, Principal principal ){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();
        return itineraryDao.deleteItineraryById(id,userId);
    }

    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
    @RequestMapping(path = "/update/{id}", method = RequestMethod.PUT)
    public Itinerary updateItinerary (@RequestBody Itinerary updatedItinerary, @PathVariable Integer id, Principal principal){
        Integer userId = userDao.getUserByUsername(principal.getName()).getId();

        return itineraryDao.updateItinerary(updatedItinerary, userId, id);
    }
}
