require 'rails_helper'

describe 'current weather' do
  it 'has attributes for the current weather', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    current_weather = forecast.current_weather

    expect(current_weather.datetime).to eq("2021-09-26 11:08:26 -0600")
    expect(current_weather.sunrise).to eq("2021-09-26 06:51:34 -0600")
    expect(current_weather.sunset).to eq("2021-09-26 18:50:40 -0600")
    expect(current_weather.temperature).to eq(81.5)
    expect(current_weather.feels_like).to eq(79.54)
    expect(current_weather.humidity).to eq(20)
    expect(current_weather.uvi).to eq(4.31)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq('clear sky')
    expect(current_weather.icon).to eq('01d')
  end
end
