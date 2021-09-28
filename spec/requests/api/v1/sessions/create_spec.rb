require 'rails_helper'

describe 'user sessions' do
  describe 'happy path' do
    it 'can return user email with api key', :vcr do
      User.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password', api_key: 'hocuspocus')
      body = {
                'email':    'test@test.com',
                'password': 'password'
              }
      headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }

       post '/api/v1/sessions', headers: headers, params: body.to_json
       session = JSON.parse(response.body, symbolize_names: true)
       attributes = session[:data][:attributes]

       expect(response).to be_successful
       expect(response.status).to eq(200)
       expect(session).to be_a(Hash)
       expect(session[:data][:type]).to eq('user')
       expect(attributes).to have_key(:email)
       expect(attributes).to have_key(:api_key)
       expect(attributes).to_not have_key(:password)
     end
   end

   describe 'sad path' do
     it 'returns an error for invalid password', :vcr do
       User.create!(email: 'email@email.com', password: 'password', password_confirmation: 'password', api_key: 'hocuspocus')
       body = {
                'email':                 'email@email.com',
                'password':              'bad_password',
              }
       headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }

        post '/api/v1/sessions', headers: headers, params: body.to_json
        session = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(session[:errors]).to eq("Invalid credentials, please try again")
     end

     it 'returns an error for invalid email', :vcr do
       User.create!(email: 'email@email.com', password: 'password', password_confirmation: 'password', api_key: 'hocuspocus')
       body = {
                'email':                 'email@email.c',
                'password':              'password',
              }
       headers = {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                }

        post '/api/v1/sessions', headers: headers, params: body.to_json
        session = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(session[:errors]).to eq("Invalid credentials, please try again")
     end
   end
 end
