require 'rails_helper'

describe 'books request' do
  describe 'happy path' do
    it 'can retrieve books for a specified locaiton', :vcr do

      get '/api/v1/book-search?location=denver,co&quantity=5'
      results = JSON.parse(response.body, symbolize_names: true)
      books = results[:data]
      attributes =  books[:attributes]

      expect(response).to be_successful
      expect(results).to be_a(Hash)
      expect(books[:type]).to eq('books')
      expect(attributes[:destination_city]).to eq('denver,co')
      expect(attributes[:forecast][:summary]).to eq('scattered clouds')
      expect(attributes[:forecast][:temperature]).to eq('75.45 F')
      expect(attributes[:total_books_found]).to eq(35990)
      expect(attributes[:books].count).to eq(5)
      expect(attributes[:books][1]).to have_key(:isbn)
      expect(attributes[:books][2]).to have_key(:title)
      expect(attributes[:books][3]).to have_key(:publisher)
    end
  end

  # describe 'sad path' do
  #   it 'returns an eror for invalid location', :vcr do
  #   end
  # end
end
