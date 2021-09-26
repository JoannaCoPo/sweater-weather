class Api::V1::ForecastController < ApplicationController
  def index
    params[:location] ? initialize_serializer : invalid_location
  end
end

private
def initialize_serializer
  location = GeocodingFacade.get_lat_long(params[:location])
  current = ForecastFacade.local_weather(location.lat, location.long)
  render json: ForecastSerializer.new(current)
end

def invalid_location
  render json: { errors: 'No location specified' }, status: 400
end
