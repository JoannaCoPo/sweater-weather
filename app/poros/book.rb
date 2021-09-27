class Book
  attr_reader :id
  def initialize(books_data)
    @id = nil
    require "pry"; binding.pry
  end
end
