class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon
  def initialize(data_per_day)
    @date = Time.at(data_per_day[:dt]).strftime('%Y-%m-%d').to_s
    @sunrise = Time.at(data_per_day[:sunrise]).to_s
    @sunset = Time.at(data_per_day[:sunset]).to_s
    @max_temp = data_per_day[:temp][:max]
    @min_temp = data_per_day[:temp][:min]
    @conditions = data_per_day[:weather].first[:description]
    @icon = data_per_day[:weather].first[:icon]
  end
end
