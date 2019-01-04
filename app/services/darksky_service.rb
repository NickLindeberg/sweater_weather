class DarkskyService

  def get_city_forecast(lat,lng)
    hash = get_json("forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}")
  end

  def conn
    Faraday.new(url:"https://api.darksky.net/")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
