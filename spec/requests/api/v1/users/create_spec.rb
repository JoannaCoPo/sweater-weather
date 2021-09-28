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

      post '/api/v1/users', headers: headers, params: body.to_json

      user = JSON.parse(response.body, symbolize_names: true)
      attributes = user[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user).to be_a(Hash)
      expect(user[:data][:type]).to eq('user')
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:api_key)
      expect(attributes).to_not have_key(:password)
    end
  end

  describe 'sad path' do
    it 'returns an error if passwords don not match', :vcr do
      body = {
               'email':                 'email@email.com',
               'password':              'password',
               'password_confirmation': 'bad_password'
             }
      headers = {
                 'Content-Type': 'application/json',
                 'Accept': 'application/json'
               }

       post '/api/v1/users', headers: headers, params: body.to_json
       user = JSON.parse(response.body, symbolize_names: true)

       expect(response).to_not be_successful
       expect(response.status).to eq(400)
       expect(user[:password_confirmation][0]).to eq("doesn't match Password")
    end

    it 'returns an error if form is incomplete', :vcr do
      body = {
               'email':                 '',
               'password':              'password',
               'password_confirmation': 'password'
             }
      headers = {
                 'Content-Type': 'application/json',
                 'Accept': 'application/json'
               }

       post '/api/v1/users', headers: headers, params: body.to_json
       user = JSON.parse(response.body, symbolize_names: true)

       expect(response).to_not be_successful
       expect(response.status).to eq(400)
       expect(user[:email][0]).to eq("can't be blank")
    end

    it 'returns an error if email already exists', :vcr do
      User.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password', api_key: 'hocuspocus')
      body = {
               'email':                 'test@test.com',
               'password':              'password',
               'password_confirmation': 'password'
             }
      headers = {
                 'Content-Type': 'application/json',
                 'Accept': 'application/json'
               }

       post '/api/v1/users', headers: headers, params: body.to_json
       user = JSON.parse(response.body, symbolize_names: true)

       expect(response).to_not be_successful
       expect(response.status).to eq(400)
       expect(user[:email][0]).to eq("has already been taken")
    end
  end
end
