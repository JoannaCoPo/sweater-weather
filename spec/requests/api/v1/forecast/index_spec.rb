require 'rails_helper'

describe 'forecast request' do
  describe 'happy path' do
    it 'can retrieve weather for a city', :vcr do

      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)
      attributes = forecast[:data][:attributes]

      expect(response).to be_successful
      expect(forecast).to be_a(Hash)
      expect(attributes).to have_key(:current_weather)
      expect(attributes).to have_key(:daily_weather)
      expect(attributes).to have_key(:hourly_weather)
    end
  end

  describe 'sad path' do
    it 'returns an error for invalid location', :vcr do

      # get '/api/v1/forecast?'
      get '/api/v1/forecast?location='
      # if time, add coverage for 'location='

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(forecast[:errors]).to eq('No location specified')
    end
  end
end
