class GeocodingFacade
  class << self
    def get_lat_long(location)
      response = MapquestService.get_location(location)
      if response[:results][0][:locations].empty?
        return 'No location specified'
      else
        data = response[:results].first[:locations].first[:latLng]
        Location.new(data)
      end
    end
  end
end
