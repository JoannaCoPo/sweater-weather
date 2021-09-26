require 'rails_helper'

RSpec.describe 'geocoding facade' do
  it 'returns the latitude and longitude of a location', :vcr do
    location = GeocodingFacade.get_lat_long('denver,co')
    expect(location).to be_a(Location)
  end

  it 'returns error if no location specified', :vcr do
    actual = GeocodingFacade.get_lat_long('')
    expected = 'No location specified'
    expect(actual).to eq(expected)
  end
end
