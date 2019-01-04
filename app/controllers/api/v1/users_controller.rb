class Api::V1::UsersController < ApplicationController

  def create
    newest_user = User.create_user(user_params)
    response = {"api_key" => "#{newest_user.api_key}"}
    render json: response
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation  )
  end
end
