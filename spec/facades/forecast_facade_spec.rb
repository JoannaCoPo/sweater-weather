require 'rails_helper'

RSpec.describe 'forecast facade', :vcr do
  it 'returns returns forecast data' do
    coords = GeocodingFacade.get_lat_long('denver,co')
    location = ForecastFacade.local_weather(coords.lat, coords.long)

    expect(location).to be_a(Forecast)
    expect(location.current_weather).to be_a(CurrentWeather)
    expect(location.daily_weather[0]).to be_a(DailyWeather)
    expect(location.daily_weather.length).to eq(5)
    expect(location.hourly_weather[7]).to be_a(HourlyWeather)
    expect(location.hourly_weather.length).to eq(8)
  end
end
