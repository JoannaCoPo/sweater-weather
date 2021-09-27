class Book
  attr_reader :id,
              :destination_city,
              :total_books_found
  def initialize(location, forecast, quantity, info)
    @id = nil
    @destination_city = location
    @forecast = forecast
    @total_books_found = quantity
    @info = info
  end

  def books
    @info.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def forecast
    {
      summary: @forecast.conditions,
      temperature: "#{@forecast.temperature} F"
    }
  end
end

# need to get bookinfo and forecast for EACH book
