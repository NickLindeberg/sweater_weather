class Api::V1::GifsController < ApplicationController

  def show
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(params[:location])
    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    days = weather[:daily][:data]
    parsed_summaries = Gifs.new(days)
    day_weather = parsed_summaries.day_parser
    #TODO searilize output data to add time summary and url for json render
    render json: day_weather
  end

end
