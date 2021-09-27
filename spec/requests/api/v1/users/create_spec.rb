require 'rails_helper'

describe 'user creation request' do
  describe 'happy path' do
    it 'can create a new user with params', :vcr do
     body = {
              'email':                 'email@email.com',
              'password':              'password',
              'password_confirmation': 'password'
            }
     headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
# need to send json payload
      post '/api/v1/users', headers: headers, params: body.to_json

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user).to be_a(Hash)
    end
  end

  # describe 'sad path' do
  #   it 'returns an eror for invalid location', :vcr do
  #   end
  # end
end
