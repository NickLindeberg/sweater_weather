class Api::V1::ForecastController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])

    giphy = GiphyService.new
    giphy_url = {"giphy_url": giphy.get_gif_url(weather[:currently][:summary])}
    weather_response = Hash.new()
    weather_response.merge!(weather)
    weather_response.merge!(giphy_url)

    render json: weather_response
  end

end
