class Api::V1::GifsController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    days = weather[:daily][:data]
    ##days give a array of hashes of days to be passed by the poro
    parsed_summaries = Gifs.new(days)
    day_weather = parsed_summaries.day_parser

    render json: day_weather
  end

end
