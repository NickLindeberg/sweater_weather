class FavoriteBuilder

  attr_reader :user_id

  def initialize(user)
    @user_id = user.id
    @user = user
    @favorites = user.favorites
    @weather_adapter = WeatherAdapter.new
    @coordinate_adapter = CoordinatesAdapter.new
  end

  def body
    data = {}
    location = @favorites.map do |fav|
      loc = {location: fav.location}
      data.merge!(loc)
      coords = @coordinate_adapter.build(fav.location)
      weather = @weather_adapter.build(coords)[:currently]
      cur = {current_weather: weather}
      data.merge!(cur)
    end
  end
end
