class Book
  attr_reader :id,
              :destination_city,
              :forecast,
              :books_found
  def initialize(location, forecast, quantity, info)
    @id = nil
    require "pry"; binding.pry
    @destination_city = location
    @forecast = forecast
    @books_found = quantity
    @info = info
  end
end

# need to get bookinfo and forecast for EACH book
