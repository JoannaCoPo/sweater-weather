class Api::V1::ForecastController < ApplicationController
  def index
    # need to grab lat/long params from mapquest
    location = params[:location]
    local_weather = ForecastFacade.local_weather(location.lat, location.long)
  end
end
