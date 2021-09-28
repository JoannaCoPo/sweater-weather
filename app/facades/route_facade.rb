class RouteFacade
  class << self
    def get_route_info(start_city, end_city)
      results = MapquestService.get_route(start_city, end_city)
      if results[:info][:statuscode] == 0
        location = GeocodingFacade.get_lat_long(end_city)
        weather = OpenWeatherService.get_forecast(location.lat,location.long)[:hourly]
        RoadtripInfo.new(results[:route], weather)
      else
        InvalidRoute.new(start_city, end_city)
      end
    end
  end
end
