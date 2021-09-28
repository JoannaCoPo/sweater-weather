class RoadTripInfo
  attr_reader :id,
              # :start_city,
              # :end_city,
              :travel_time,
              :weather_at_eta
  def initialize(route_data, weather)
    require "pry"; binding.pry
    @id = nil
    @location_data = route_data[:locations]
    # @start_city
    # @end_city
    # @travel_time
    # @weather_at_eta
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
end
