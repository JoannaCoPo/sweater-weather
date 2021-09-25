require 'rails_helper'

RSpec.describe 'geocoding facade' do
  it 'returns the latitude and longitude of a location', :vcr do
    location = GeocodingFacade.get_lat_long('denver,co')
    expect(location).to be_a(Location)
  end
end
