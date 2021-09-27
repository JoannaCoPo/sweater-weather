class Api::V1::UsersController < ApplicationController
  def index
    user = User.new(user_params)
    if user.save
      # generate new api key?
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors, status: 400
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation) # probably api_key as params too
  end
end

# create new user in DB
# generates a unqique api key
# 201 status
