class Forecast
  attr_reader :current_weather
  def initialize(data) #pass this to current_weather obj?
    # create a current_weather poros to store all of those attributes and the call here?
    @current_weather = CurrentWeather.new()
  end
end

# will need:
  # current_weather:
    # datetime, in a human-readable format such as “2020-09-30 13:27:03 -0600”
    # sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
    # sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
    # temperature, floating point number indicating the current temperature in Fahrenheit
    # feels_like, floating point number indicating a temperature in Fahrenheit
    # humidity, numeric (int or float), as given by OpenWeather
    # uvi, numeric (int or float), as given by OpenWeather
    # visibility, numeric (int or float), as given by OpenWeather
    # conditions, the first ‘description’ field from the weather data as given by OpenWeather
    # icon, string, as given by OpenWeather
  # daily_weather, array of the next 5 days of daily weather data
    # date, in a human-readable format such as “2020-09-30”
    # sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
    # sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
    # max_temp, floating point number indicating the maximum expected temperature in Fahrenheit
    # min_temp, floating point number indicating the minimum expected temperature in Fahrenheit
    # conditions, the first ‘description’ field from the weather data as given by OpenWeather
    # icon, string, as given by OpenWeather
  # hourly_weather, array of the next 8 hours of hourly weather data
    # time, in a human-readable format such as “14:00:00”
    # temperature, floating point number indicating the current temperature in Fahrenheit
    # conditions, the first ‘description’ field from the weather data as given by OpenWeather
    # icon, string, as given by OpenWeather
