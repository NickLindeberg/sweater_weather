class GifBuilder

  def initialize(location)
    @location = location
    @weather_adapter = WeatherAdapter.new
    @coordinate_adapter = CoordinatesAdapter.new
    @gif_adapter = GifAdapter.new
    @coords = @coordinate_adapter.build(@location)
  end

  def attributes
    attributes = {}
      @weather_adapter[:daily][:data]

  end

end
