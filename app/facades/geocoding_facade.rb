class GeocodingFacade
  class << self
    def get_lat_long(location)
      response = MapquestService.get_location(location)
      data = response[:results].first[:locations].first[:latLng]
      Location.new(data)
    end
  end
end
