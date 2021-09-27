class LibraryService
  class << self
    def get_books(location, quantity)
      response = connection.get("/search.json?q=#{location}&limit=#{quantity}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      Faraday.new('http://openlibrary.org')
    end
  end
end
