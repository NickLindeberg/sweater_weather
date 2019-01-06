class Api::V1::SessionsController < ApplicationController

  def create
    session_user = User.find_by(email: params[:email])
    if session_user
      render json: UserSerializer.new(session_user), status: 200
    else
      render json: "Login Failed", status: 401
    end
  end

end
