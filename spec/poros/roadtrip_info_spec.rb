require 'rails_helper'

describe 'roadtrip info' do
  it 'has attributes for a road trip', :vcr do
    results = MapquestService.get_route('denver,co', 'pueblo,co')
    location = GeocodingFacade.get_lat_long('pueblo,co')
    weather = OpenWeatherService.get_forecast(location.lat,location.long)[:hourly]
    trip = RoadtripInfo.new(results[:route], weather)

    expect(trip.start_city).to eq('Denver, CO')
    expect(trip.end_city).to eq('Pueblo, CO')
    expect(trip.travel_time).to eq('1 hour(s), 44 minute(s)')
    expect(trip.weather_at_eta[:temperature]).to eq(75.85)
    expect(trip.weather_at_eta[:conditions]).to eq('broken clouds')
  end
end
