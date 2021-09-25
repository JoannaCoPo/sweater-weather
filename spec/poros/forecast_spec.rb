require 'rails_helper'

describe 'Forecast' do
  it 'has attributes for the current weather' do

    forecast = Forecast.new(data)
    expect(forecast.current_weather).to be_an_instance_of()
  end
end
