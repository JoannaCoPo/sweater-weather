require 'rails_helper'

describe 'Location' do
  it 'returns location object with latitude and longitude' do
    latLng = {
      "lat": 39.738453,
      "lng": -104.984853
    }
    denver = Location.new(latLng)
    expect(denver.lat).to eq(39.738453)
    expect(denver.long).to eq(-104.984853)
  end
end
