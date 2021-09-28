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
      attributes = road_trip[:data][:attributes]

      expect(response).to be_successful
      expect(road_trip).to be_a(Hash)
      expect(road_trip[:data]).to have_key(:attributes)
      expect(attributes[:start_city]).to eq('Denver, CO')
      expect(attributes[:end_city]).to eq('Pueblo, CO')
      expect(attributes[:travel_time]).to eq('1 hour(s), 44 minute(s)')
      expect(attributes[:weather_at_eta]).to have_key(:temperature)
      expect(attributes[:weather_at_eta]).to have_key(:conditions)
    end
  end

  describe 'sad path' do
    it 'returns an error for incorrect api key ', :vcr do
      User.create!(email: 'test@test.com', password: 'password',
                   password_confirmation: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
      body = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "notavalidkey"
              }
      headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }
      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(road_trip[:errors]).to eq('Unauthorized request')
    end

    it 'returns an error for missing api key ', :vcr do
      User.create!(email: 'test@test.com', password: 'password',
                   password_confirmation: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
      body = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO"
              }
      headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }
      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(road_trip[:errors]).to eq('Unauthorized request')
    end
  end

  describe 'edge case' do
    it 'returns advises that roadtrip overseas is not possible', :vcr do
      User.create!(email: 'test@test.com', password: 'password',
                   password_confirmation: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
      body = {
                "origin": "Denver,CO",
                "destination": "Honolulu, HI",
                "api_key": "jgn983hy48thw9begh98h4539h4"
              }
      headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }
      post '/api/v1/road_trip', headers: headers, params: body.to_json

      road_trip = JSON.parse(response.body, symbolize_names: true)
      attributes = road_trip[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(attributes).to have_key(:start_city)
      expect(attributes).to have_key(:end_city)
      expect(attributes).to have_key(:travel_time)
      expect(attributes[:travel_time]).to eq("Impossible! You can't drive over water!")
      expect(attributes[:weather_at_eta]).to eq({})
    end
  end
end
