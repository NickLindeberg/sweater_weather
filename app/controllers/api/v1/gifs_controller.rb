class Api::V1::GifsController < ApplicationController

  def show
    require "pry"; binding.pry
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    gifs = GiphyService.new
    # gif = gifs.get_gif(params[:])
  end

end
