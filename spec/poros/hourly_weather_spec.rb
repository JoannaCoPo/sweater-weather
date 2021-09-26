require 'rails_helper'

describe 'hourly weather' do
  it 'has attributes for weather per hour', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    hourly_weather = forecast.hourly_weather

    expect(hourly_weather[0].time).to eq('11:00:00')
    expect(hourly_weather[1].temperature).to eq(82.94)
    expect(hourly_weather[2].conditions).to eq('clear sky')
    expect(hourly_weather[3].icon).to eq('02d')
    expect(hourly_weather[4].time).to eq('15:00:00')
    expect(hourly_weather[5].temperature).to eq(87.08)
    expect(hourly_weather[6].conditions).to eq('few clouds')
    expect(hourly_weather[7].icon).to eq('03d')
  end
end
