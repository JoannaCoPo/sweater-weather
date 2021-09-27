require 'rails_helper'

RSpec.describe 'book facade' do
  it 'returns returns forecast data', :vcr do
    books = BookFacade.books_by_location('denver,co', 5)

    expect(books).to be_a(Book)
    expect(books.destination_city).to eq('denver,co')
    expect(books.forecast).to eq({:summary=>"scattered clouds", :temperature=>"81.73 F"})
  end
end
