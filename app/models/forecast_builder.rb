class ForecastBuilder

  def initialize(location)
    @location = location
    @weather_adapter = WeatherAdapter.new
    @coordinate_adapter = CoordinatesAdapter.new
    @gif_adapter = GifAdapter.new
    @coords = @coordinate_adapter.build(@location)
  end

  def location
    @location
  end

  def currently
    @weather_adapter.build(@coords)[:currently]
  end

  def daily
    days = @weather_adapter.build(@coords)[:daily][:data]
    total = days.map do |data|
      DailyWeather.new(data)
    end
  end

  def hourly
    hours = @weather_adapter.build(@coords)[:hourly][:data]
    total = hours.map do |data|
      HourlyWeather.new(data)
    end.first(8)
  end
end
