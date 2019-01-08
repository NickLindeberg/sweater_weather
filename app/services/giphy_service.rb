class GiphyService

  def get_gif(search_term)
    hash = get_json("v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{search_term}")[:data][0]
  end

  def get_gif_url(search_term)
    hash = get_json("v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{search_term}")[:data][0][:embed_url]
  end

  def conn
    Faraday.new(url: "https://api.giphy.com/")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
