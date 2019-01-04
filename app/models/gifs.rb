class Gifs

  def initialize(days)
    @days = days
    require "pry"; binding.pry
  end

  def day_parser
    @days.map do |d|
      d[:summary]
    end
  end
end
