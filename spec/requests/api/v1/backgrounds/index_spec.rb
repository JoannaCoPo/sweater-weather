require 'rails_helper'

describe 'background image request' do
  describe 'happy path' do
    it 'can retrieve a backgroun image for a city', :vcr do

      get '/api/v1/backgrounds?location=denver,co'

      json = JSON.parse(response.body, symbolize_names: true)
      attributes = json[:data][:attributes]

      expect(response).to be_successful
      expect(json).to be_a(Hash)
      expect(attributes[:location]).to eq('denver,co')
      expect(attributes).to have_key(:image_url)
      expect(attributes[:credit][:source]).to eq('unsplash.com')
    end
  end

  describe 'sad path' do
    it 'returns an eror for invalid location', :vcr do

      get '/api/v1/backgrounds'

      background = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(background[:errors]).to eq('No location specified')
    end
  end
end
