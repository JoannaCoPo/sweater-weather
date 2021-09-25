class ForecastFacade
  class << self
    def local_weather
      response = OpenWeatherService.get_forecast(lat,long)
      Forecast.new(response)
    end
  end
end
