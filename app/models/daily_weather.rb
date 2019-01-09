class DailyWeather

  attr_reader :time,
              :summary,
              :icon,
              :precipiation,
              :icon,
              :high,
              :low,
              :visiabity,
              :gif_url

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary].gsub(/[^0-9a-z ]/i, '')
    @icon = [:icon]
    @precipiation = [:precipProbability]
    @icon = [:icon]
    @high = [:temperatureHigh]
    @low = [:temperatureLow]
    @visibility = [:visibility]
    gif_adapter = GifAdapter.new
    @gif_url = gif_adapter.build(@summary)
  end

end
