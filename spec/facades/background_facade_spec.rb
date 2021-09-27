require 'rails_helper'

RSpec.describe 'background facade' do
  it 'returns returns forecast data', :vcr do
    image = BackgroundFacade.get_location_image('denver,co')

    expect(image).to be_an(Image)
    expect(image.location).to eq('denver,co')
    expect(image.credit[:author]).to eq('Ryan De Hamer')
  end

  it 'returns an error if no location is specified', :vcr do
    actual = BackgroundFacade.get_location_image('')
    expected = 'Invalid location'
    expect(actual).to eq(expected)
  end
end
