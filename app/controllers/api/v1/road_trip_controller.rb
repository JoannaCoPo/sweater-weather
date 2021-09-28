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
