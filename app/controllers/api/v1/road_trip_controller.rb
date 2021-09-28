class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      road_trip = RouteFacade.get_route_info(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { errors: 'Unauthorized request' }, status: 401
    end
  end
end

# a data attribute, under which all other attributes are present:
  # id, always set to null
  # type, always set to “roadtrip”
  # attributes, an object containing road trip information:
    # start_city, string, such as “Denver, CO”
    # end_city, string, such as “Estes Park, CO”
    # travel_time, string, something user-friendly like “2 hours, 13 minutes” or “2h13m” or “02:13:00” or something of that nature (you don’t have to include seconds); set this string to “impossible route” if there is no route between your cities
    # weather_at_eta, conditions at end_city when you arrive (not CURRENT weather), object containing:
      # temperature, numeric value in Fahrenheit
      # conditions, string, as given by OpenWeather
      # note: this object will be blank if the travel time is impossible
