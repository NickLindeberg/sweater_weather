class ForecastBuilder

  def initialize
    @weather_adapter = WeatherAdapter.new
  end


  def build_forecast(location)
    googe_data = GoogleCoordinateService.new
    coords = googe_data.get_coordinates(location)

    weather = @weather_adapter.build(coords)

    giphy = GiphyService.new
    giphy_url = {"giphy_url": giphy.get_gif_url(weather[:currently][:summary])}

    weather_response = Hash.new()
    weather_response.merge!(weather)
    weather_response.merge!(giphy_url)
  end
end
