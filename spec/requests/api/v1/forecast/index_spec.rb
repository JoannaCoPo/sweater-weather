require 'rails_helper'

describe 'forecast request' do
  describe 'happy path' do
    it 'can retrieve weather for a city', :vcr do

      get '/api/v1/forecast?location=denver,co'

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_successful
      expect(forecast).to be_a(Hash)
    end
  end
end

# add sad path
