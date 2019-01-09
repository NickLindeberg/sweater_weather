class GifAdapter

  def build(weather_summary)
    service = GiphyService.new
    service.get_gif_url(weather_summary)
  end

end
