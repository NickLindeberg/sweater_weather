class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoriteSerializer.new(FavoriteBuilder.new(user))
    else
      render json: "Error", status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = Favorite.find_or_create_by(location: clean_up_city(params[:location]))
      success = user.user_favorites.create(favorite_id: favorite.id)
      render json: "Good Job", status: 204
    else
      render json: "Error", status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])

    if user
      favorite = user.favorites.find_by(location: clean_up_city(params[:location]))
      favorite.destroy
      render json: "Favorite Removed", status: 204
    else
      render json: "Favorite Not Deleted", status: 401
    end
  end

private

  def clean_up_city(city)
    city.split.join.downcase
  end

end
