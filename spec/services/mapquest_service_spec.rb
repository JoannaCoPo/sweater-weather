require 'rails_helper'

RSpec.describe MapquestService do
  it 'can get location data for a specified location', :vcr do
    data = MapquestService.get_location('denver')
    coords = data[:results][0][:locations][0][:latLng]

    expect(data).to be_a(Hash)
    expect(coords).to have_key(:lat)
    expect(coords).to have_key(:lng)
    expect(coords[:lat]).to eq(39.738453)
    expect(coords[:lng]).to eq(-104.984853)
  end
end
