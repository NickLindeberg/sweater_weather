class Api::V1::GifsController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])

    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])

    weather_summary = weather[:daily][:summary]

    service = GiphyService.new
    days = weather[:daily][:data]

    parsed_summaries = Gifs.new(days)
require "pry"; binding.pry
    # day_weather = parsed_summaries.day_parser
    # render json: day_weather

    time = {time: weather[:daily][:time]}

  end

end
