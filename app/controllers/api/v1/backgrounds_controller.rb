class Api::V1::BackgroundsController < ApplicationController
  def index
    params[:location] ? initialize_serializer : invalid_location
  end

  def initialize_serializer
    image = BackgroundFacade.get_location_image(params[:location])
    render json: ImageSerializer.new(image)
  end

  def invalid_location
    render json: { errors: 'No location specified' }, status: 400
  end
end
