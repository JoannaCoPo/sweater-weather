require 'rails_helper'

describe 'daily weather' do
  xit 'has attributes for weather per day', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    daily_weather = forecast.daily_weather

    expect(daily_weather[0].date).to eq('2021-10-08')
    expect(daily_weather[1].sunrise).to eq('2021-10-09 07:04:09 -0600')
    expect(daily_weather[2].sunset).to eq('2021-10-10 18:28:12 -0600')
    expect(daily_weather[3].max_temp).to eq(70.25)
    expect(daily_weather[4].min_temp).to eq(50.29)
    expect(daily_weather[0].conditions).to eq('overcast clouds')
    expect(daily_weather[1].conditions).to eq('scattered clouds')
    expect(daily_weather[2].icon).to eq('01d')
    expect(daily_weather[3].icon).to eq('03d')
  end
end
