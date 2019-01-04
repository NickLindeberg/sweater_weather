class Gifs

  def initialize(days)
    @days = days
  end

  def day_parser
    day_array = @days.map do |d|
      d[:summary]
    end
    service = GiphyService.new
    day_array.each do |day|
      service.get_gif(day)
    end
  end


end
