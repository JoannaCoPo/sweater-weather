require 'rails_helper'

describe 'forecast request' do
  describe 'happy path' do
    it 'can retrieve weather for a city', :vcr do

      get ""

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(forecast).to be_a(Hash)
    end
  end
end
