class Api::V1::GifsController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    daily = weather[:daily]
    summary = daily[:data][0][:summary]
    gifs = GiphyService.new
    giphy_search = gifs.get_gif(summary)
    render json: giphy_search
  end

end
