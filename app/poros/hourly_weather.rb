class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon
  def initialize(data_per_hour)
    @time = Time.at(data_per_hour[:dt]).strftime('%T')
    @temperature = data_per_hour[:temp]
    @conditions = data_per_hour[:weather].first[:description]
    @icon = data_per_hour[:weather].first[:icon]
  end
end

# time, in a human-readable format such as “14:00:00”
# temperature, floating point number indicating the current temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
