require 'rails_helper'

RSpec.describe 'background facade' do
  it 'returns returns forecast data', :vcr do
    image = BackgroundFacade.get_location_image('denver,co')

    expect(image).to be_an(Image)
    expect(image.location).to eq('denver,co')
    expect(image.credit[:author]).to eq('Ryan De Hamer')
  end
end
