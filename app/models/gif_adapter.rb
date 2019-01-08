class GifAdapter

  def build(weather)
    service = GiphyService.new
    service.get_gif_url(weather)
  end

end
