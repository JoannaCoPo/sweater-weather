class MapquestService
  class << self
    def get_location(location)
      response = connection.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_KEY']}&location=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def connection
      Faraday.new('http://www.mapquestapi.com')
    end
  end
end
