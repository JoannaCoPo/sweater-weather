require 'rails_helper'

RSpec.describe 'route facade' do
  it 'returns route data per start and end points', :vcr do
    data = RouteFacade.get_route_info('denver,co', 'pueblo,co')
    expect(data).to be_a(RoadtripInfo)
  end

  it 'returns invalid route response for overseas route', :vcr do
    data = RouteFacade.get_route_info('denver,co', 'honolulu,hi')
    
    expect(data.travel_time).to eq("Impossible! You can't drive over water!")
    expect(data.weather_at_eta).to eq({})
  end
end
