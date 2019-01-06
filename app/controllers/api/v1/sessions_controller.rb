class Api::V1::SessionsController < ApplicationController

  def create
    session_user = User.find_by(email: params[:email])
    if session_user
      render json: "User Created"
    else
      render json: "Login Failed", status: 401
    end
  end

end
