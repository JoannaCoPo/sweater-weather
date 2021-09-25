class OpenWeatherService
  class << self
    def get_forecast(lat,long)
        response = connection.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&appid=#{ENV['OPEN_WEATHER_KEY']}&units=imperial")
        JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      Faraday.new('https://api.openweathermap.org')
    end
  end
end
