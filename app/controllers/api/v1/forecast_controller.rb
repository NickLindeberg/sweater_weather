class Api::V1::ForecastController < ApplicationController

  def show
    builder = ForecastBuilder.new
    weather_response = builder.build_forecast(params[:location])
    
    render json: weather_response
  end

end
