class Api::V1::ForecastController < ApplicationController

  def show
    weather = ForecastBuilder.new()
    weather_response = weather.build_forecast(params[:location])

    render json: weather_response
  end

end
