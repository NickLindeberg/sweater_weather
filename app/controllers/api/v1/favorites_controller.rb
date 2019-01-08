class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])

    if user
      favorites = user.favorites.map do |fav|
        googe_data = GoogleCoordinateService.new
        coords = googe_data.get_coordinates(fav[:location])
        darksky = DarkskyService.new
        weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
        location = {"location": fav[:location]}
        currently = {"current_weather": weather[:currently]}
        data = {}
        data.merge!(location)
        data.merge!(currently)
      end
      render json: favorites, status: 200
    else
      render json: "Error", status: 401
    end
  end


  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = Favorite.find_or_create_by(location: params[:location].split.join.downcase)
      success = user.user_favorites.create(favorite_id: favorite.id)
      render json: "Good Job", status: 204
    else
      render json: "Error", status: 401
    end
  end

end
