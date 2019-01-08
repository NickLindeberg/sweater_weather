class DailyWeather

  attr_reader :time,
              :summary,
              :icon,
              :precipiation,
              :icon,
              :high,
              :low,
              :visiabity

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary]
    @icon = [:icon]
    @precipiation = [:precipProbability]
    @icon = [:icon]
    @high = [:temperatureHigh]
    @low = [:temperatureLow]
    @visibility = [:visibility]
  end

end
