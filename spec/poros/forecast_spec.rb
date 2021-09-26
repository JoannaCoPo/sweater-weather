require 'rails_helper'

describe 'Forecast' do
  it 'has attributes for the current weather', :vcr do
    data = OpenWeatherService.get_forecast(39.738453, -104.984853)
    forecast = Forecast.new(data)
    
    expect(forecast.current_weather).to be_an_instance_of(CurrentWeather)
    expect(forecast.daily_weather[0]).to be_an_instance_of(DailyWeather)
    expect(forecast.daily_weather.length).to eq(5)
    expect(forecast.hourly_weather[0]).to be_an_instance_of(HourlyWeather)
    expect(forecast.hourly_weather.length).to eq(8)
  end
end
