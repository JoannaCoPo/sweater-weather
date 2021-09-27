require 'rails_helper'

describe 'books request' do
  describe 'happy path' do
    it 'can retrieve books for a specified locaiton', :vcr do

      get '/api/v1/books-searchlocation=denver,co&quantity=5'
      books = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(books).to be_a(Hash)
    end
  end

  # describe 'sad path' do
  #   it 'returns an eror for invalid location', :vcr do
  #   end
  # end
end
