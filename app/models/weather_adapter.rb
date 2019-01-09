class WeatherAdapter

  def build(coords)
    service = DarkskyService.new
    service.get_city_forecast(coords[:lat], coords[:lng])
  end

end
