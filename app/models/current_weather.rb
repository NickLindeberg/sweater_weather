class CurrentWeather

  attr_reader :time,
              :summary,
              :precipiation,
              :temp,
              :humidity,
              :uv_index,
              :visiabity

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary]
    @precipiation = [:precipProbability]
    @temp = [:apparentTemperature]
    @humidity = [:humidity]
    @uv_index = [:uvIndex]
    @visibility = [:visibility]
  end

end
