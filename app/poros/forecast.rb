class Forecast
  attr_reader :current_weather, :id
  def initialize(data) #pass this to current_weather obj?
    # create a current_weather poros to store all of those attributes and the call here?
    require "pry"; binding.pry
    @current_weather = CurrentWeather.new(data[:current])
    @id = nil # id is a mandatory field in the jsonapi spec
    @daily_weather = data[:daily]
  end

  def daily_weather
    next_five_days = @daily_weather.first(5)
    next_five_days.map do |day|
      DailyWeather.new(day)
    end
  end
end

# will need:
  # current_weather
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
