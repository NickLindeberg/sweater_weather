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
    body = []
    favs = @favorites.map do |fav|
      data = {}
      data[:location] = fav.location
      coords = @coordinate_adapter.build(fav.location)
      weather = @weather_adapter.build(coords)[:currently]
      data[:current_weather] = weather
      data
      body << data
    end
  end
end
