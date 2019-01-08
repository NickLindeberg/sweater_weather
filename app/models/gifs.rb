class Gifs

  def initialize(days)
    @days = days
  end

  def day_parser
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
