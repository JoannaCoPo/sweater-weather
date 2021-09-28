class InvalidRoute
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta
  def initialize(start_city, end_city)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = "Impossible! You can't drive over water!"
    @weather_at_eta = {}
  end
end
