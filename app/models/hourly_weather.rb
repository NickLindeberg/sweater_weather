class HourlyWeather

  attr_reader :time,
              :temp

  def initialize(data)
    @time = data[:time]
    @temp = data[:temperature]
  end

end
