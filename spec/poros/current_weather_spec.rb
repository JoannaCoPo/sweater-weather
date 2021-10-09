require 'rails_helper'

describe 'current weather' do
  it 'has attributes for the current weather', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    current_weather = forecast.current_weather

    expect(current_weather.datetime).to eq("2021-10-08 23:51:22 -0600")
    expect(current_weather.sunrise).to eq("2021-10-08 07:03:09 -0600")
    expect(current_weather.sunset).to eq("2021-10-08 18:31:18 -0600")
    expect(current_weather.temperature).to eq(57.33)
    expect(current_weather.feels_like).to eq(55.2)
    expect(current_weather.humidity).to eq(52)
    expect(current_weather.uvi).to eq(0)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq('broken clouds')
    expect(current_weather.icon).to eq('04n')
  end
end
