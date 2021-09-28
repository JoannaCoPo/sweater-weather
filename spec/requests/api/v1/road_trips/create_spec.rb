require 'rails_helper'

describe 'road trip creation request' do
  describe 'happy path' do
    it 'can create a road trip response', :vcr do
      User.create!(email: 'test@test.com', password: 'password',
                   password_confirmation: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
      body = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "jgn983hy48thw9begh98h4539h4"
              }
      headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }
      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(road_trip).to be_a(Hash)
    end
  end

  # describe 'sad path' do
  #   it 'returns an eror for ', :vcr do
  #   end
  # end
end
