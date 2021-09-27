class BookFacade
  class << self
    def books_by_location(location, quantity)
      forecast = weather(location)
      response = LibraryService.get_books(location, quantity)
      Book.new(location, forecast, response[:numFound], response[:docs])
    end

    def weather(location)
      coords = GeocodingFacade.get_lat_long(location)
      ForecastFacade.local_weather(coords.lat, coords.long).current_weather
    end
  end
end
