class ForecastSerializer
  include FastJsonapi::ObjectSerializer
    attributes :current_weather, :daily_weather
end
