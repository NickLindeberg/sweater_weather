class Api::V1::ForecastController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])

    render json: weather
  end


end
