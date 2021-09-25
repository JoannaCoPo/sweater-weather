class Api::V1::ForecastController < ApplicationController
  def index
    location = GeocodingFacade.get_lat_long(params[:location])
    local_weather = ForecastFacade.local_weather(location.lat, location.long)
    render json: ForecastSerializer.new(current_weather)
  end
end

# maybe add conditional: error for when no location is provided
