require 'rails_helper'

RSpec.describe UnsplashService do
  it 'returns image data for a specified location', :vcr do
    data = UnsplashService.get_images('denver')
    attributes = data[:results][0]

    expect(data).to be_a(Hash)
    expect(attributes[:user][:name]).to eq('Andrew Coop')
    expect(attributes).to have_key(:urls)
    expect(attributes[:user][:links][:html]).to eq('https://unsplash.com/@andrewcoop')
  end
end
