class Gifs

  def initialize(days)
    @days = days
  end

  def day_parser
    require "pry"; binding.pry
    # googe_data = GoogleCoordinateService.new
    # coords = googe_data.get_coordinates(params[:location])
    # darksky = DarkskyService.new
    # weather = darksky.get_city_forecast(coords[:lat], coords[:lng])
    # giphy = GiphyService.new
    day_array = @days.map do |d|
      d[:summary]
    end
    service = GiphyService.new
    day_objects = day_array.map do |day|
      service.get_gif(day)
    end
    day_objects.map do |ob|
      ob[:data][0][:embed_url]
    end
  end



end
