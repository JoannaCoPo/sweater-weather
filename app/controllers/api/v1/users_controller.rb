class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      # generate new api key? or just call here
      user.api_key
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors, status: 400
    end
  end
# why is :id nested before :type in reponse?
  private
  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key) # probably api_key as params too
  end
end

# create new user in DB
# generates a unqique api key
# 201 status
