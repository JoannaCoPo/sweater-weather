class RoadTripInfo
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_etag
  def initialize(route_data, weather)
    require "pry"; binding.pry
    @id = nil
    # @start_city
    # @end_city
    # @travel_time
    # @weather_at_eta
  end
end
