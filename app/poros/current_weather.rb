class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon
  def initialize(data)
    @datetime = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end

# datetime, in a human-readable format such as “2020-09-30 13:27:03 -0600”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# temperature, floating point number indicating the current temperature in Fahrenheit
# feels_like, floating point number indicating a temperature in Fahrenheit
# humidity, numeric (int or float), as given by OpenWeather
# uvi, numeric (int or float), as given by OpenWeather
# visibility, numeric (int or float), as given by OpenWeather
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
#icon is in [:weather]
