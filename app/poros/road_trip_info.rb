class RoadTripInfo
  attr_reader :id, :weather_at_eta, :time_to_arrival
  def initialize(route_data, weather)
    @id = nil
    @location_data = route_data[:locations]
    @format_time = route_data[:formattedTime].split(':')
    @time_to_arrival = route_data[:formattedTime].split(':')[0].to_i
    @weather_at_eta = weather[@time_to_arrival]
  end

  def start_city
    city = @location_data[0][:adminArea5]
    state = @location_data[0][:adminArea3]
    city.concat(", ", state)
  end

  def end_city
    city = @location_data[1][:adminArea5]
    state = @location_data[1][:adminArea3]
    city.concat(", ", state)
  end

  def travel_time
    hours = @format_time[0].to_i
    minutes = @format_time[1].to_i
    "#{hours} hour(s), #{minutes} minute(s)"
  end

  def weather_at_eta #what if forecast is not available?
    weather  = HourlyWeather.new(@weather_at_eta)
    {
      temperature: weather.temperature,
      conditions: weather.conditions
    }
  end
end
