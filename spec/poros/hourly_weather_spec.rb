require 'rails_helper'

describe 'hourly weather' do
  xit 'has attributes for weather per hour', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    hourly_weather = forecast.hourly_weather

    expect(hourly_weather[0].time).to eq('23:00:00')
    expect(hourly_weather[1].temperature).to eq(57.33)
    expect(hourly_weather[2].conditions).to eq('broken clouds')
    expect(hourly_weather[3].icon).to eq('04n')
    expect(hourly_weather[4].time).to eq('03:00:00')
    expect(hourly_weather[5].temperature).to eq(60.66)
    expect(hourly_weather[6].conditions).to eq('overcast clouds')
    expect(hourly_weather[7].icon).to eq('04n')
  end
end
