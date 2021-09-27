require 'rails_helper'

describe 'image' do
  it 'has image attributes for specified city', :vcr do
    image = BackgroundFacade.get_location_image('denver, co')

    expect(image).to be_instance_of(Image)
    expect(image.credit[:source]).to eq('unsplash.com')
    expect(image.location).to eq('denver, co')
    expect(image.image_url.length).to eq(189)
  end
end
