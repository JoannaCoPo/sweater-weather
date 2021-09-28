class RouteFacade
  class << self
    def get_route_info(start_city, end_city)
      results = MapquestService.get_route(start_city, end_city)
      # maybe error handling conditional here?
      location = GeocodingFacade.get_lat_long(end_city)
      weather = OpenWeatherService.get_forecast(location.lat,location.long)[:hourly]
      RoadTripInfo.new(results[:route], weather)
    end
  end
end
