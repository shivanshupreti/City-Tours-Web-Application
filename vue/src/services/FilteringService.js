import LandmarkService from './LandmarkService';

export default {
  async filterLandmarks(criteria) {
    try {
      let response;
      if (criteria.startsWith('city: ')) {
        const city = criteria.replace('city: ', '');
        response = await LandmarkService.listByCity(city);
      } else if (criteria.startsWith('venueType: ')) {
        const venueType = criteria.replace('venueType: ', '');
        response = await LandmarkService.listByVenueType(venueType);
      } else if (criteria.startsWith('dayOfWeek: ')) {
        const dayOfWeek = criteria.replace('dayOfWeek: ', '');
        response = await LandmarkService.listByDayOfWeek(dayOfWeek);
      } else {
        response = await LandmarkService.listAll();
      }
      
      
      const landmarks = response.data;
      return landmarks;
    } catch (error) {
      console.error('Error filtering landmarks:', error);
      throw error;
    }
  }
};