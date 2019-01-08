class Api::V1::ForecastController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])

    giphy = GiphyService.new
    require "pry"; binding.pry
    giphy_url = giphy.get_gif(weather[:currently][:summary])
    render json: weather
  end


end
