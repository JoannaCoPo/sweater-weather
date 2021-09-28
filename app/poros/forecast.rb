class Forecast
  attr_reader :current_weather, :id
  def initialize(data)
    @current_weather = CurrentWeather.new(data[:current])
    @id = nil 
    @daily_weather = data[:daily]
    @hourly_weather = data[:hourly]
  end

  def daily_weather
    next_five_days = @daily_weather.first(5)
    next_five_days.map do |day|
      DailyWeather.new(day)
    end
  end

  def hourly_weather
    next_eight_hours = @hourly_weather.first(8)
    next_eight_hours.map do |hour|
      HourlyWeather.new(hour)
    end
  end
end
