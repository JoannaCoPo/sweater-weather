class BookFacade
  class << self
    def books_by_location(location, quantity)
      forecast = weather(location)
      response = LibraryService.get_books(location, quantity)
      Book.new(location, forecast)
    end

    def weather(location)
      GeocodingFacade.get_lat_long(location)
      ForecastFacade.local_weather(location.lat, location.long).current_weather
    end
  end
end
