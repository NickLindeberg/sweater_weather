class Api::V1::GifsController < ApplicationController

  def show
    gifs = GiphyService.new
    # coords = googe_data.get_coordinates(params[:location])
    # darksky = DarkskyService.new
    # weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    # render json: weather
  end

end
