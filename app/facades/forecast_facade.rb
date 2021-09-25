class ForecastFacade
  class << self
    def local_weather(lat, long)
      data = OpenWeatherService.get_forecast(lat,long)
      Forecast.new(data)
    end
  end
end
