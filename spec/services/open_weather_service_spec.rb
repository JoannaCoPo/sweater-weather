require 'rails_helper'

RSpec.describe OpenWeatherService do
  it 'can get forcast data for a specified location', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:lat)
    expect(data).to have_key(:lon)
    expect(data).to have_key(:current)
    expect(data).to have_key(:daily)
    expect(data).to have_key(:hourly)
  end
end
