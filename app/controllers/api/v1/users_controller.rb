class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.api_key
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors, status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
