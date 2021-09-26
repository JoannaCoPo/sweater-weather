require 'rails_helper'

describe 'daily weather' do
  it 'has attributes for weather per day', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    daily_weather = forecast.daily_weather

    expect(daily_weather[0].date).to eq('2021-09-26')
    expect(daily_weather[1].sunrise).to eq('2021-09-27 06:52:30 -0600')
    expect(daily_weather[2].sunset).to eq('2021-09-28 18:47:23 -0600')
    expect(daily_weather[3].max_temp).to eq(70.59)
    expect(daily_weather[4].min_temp).to eq(51.35)
    expect(daily_weather[0].conditions).to eq('clear sky')
    expect(daily_weather[1].conditions).to eq('overcast clouds')
    expect(daily_weather[2].icon).to eq('04d')
    expect(daily_weather[3].icon).to eq('10d')
  end
end
