class MapquestService
  class << self
    def get_location(location)
      response = connection.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_KEY']}&location=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_route(start_city, end_city)
      response = connection.get("/directions/v2/route?key=#{ENV['MAPQUEST_KEY']}&from=#{start_city}&to=#{end_city}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private
    def connection
      Faraday.new('http://www.mapquestapi.com')
    end
  end
end
