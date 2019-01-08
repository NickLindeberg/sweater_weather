class Api::V1::GifsController < ApplicationController

  def show

    # GifSerializer.new(GifBuilder(params[:location]))
    # Will refactor if I have time

    google_data = GoogleCoordinateService.new
    coords = google_data.get_coordinates(params[:location])

    darksky = DarkskyService.new
    weather = darksky.get_city_forecast(coords[:lat], coords[:lng])

    weather_summary = weather[:daily][:summary]

    service = GiphyService.new
    days = weather[:daily][:data]

    hash = Hash.new(0)
    times = days.map do |day|
      hash.merge!({time: day[:time]})
      summary = hash.merge!({daily_summary: day[:summary]})
      hash.merge!({giphy_url: service.get_gif_url(summary)})
    end

    attributes = Hash.new()
    attributes.merge!(attributes: times)

    render json: attributes
  end
end
