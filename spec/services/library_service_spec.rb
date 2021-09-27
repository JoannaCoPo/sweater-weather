require 'rails_helper'

RSpec.describe LibraryService do
  it 'returns book data for a specified location', :vcr do
    data = UnsplashService.get_images('denver')

    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
  end
end
