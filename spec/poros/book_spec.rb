require 'rails_helper'

describe 'books' do
  xit 'has book attributes for specified city', :vcr do
    books = [
        {
          isbn: ["12345", "678910"],
          title: "Denver Book",
          publisher: ["Publisher"]
        }
      ]

    expect(books).to be_instance_of(Book)
  end
end
