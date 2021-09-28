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
