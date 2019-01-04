class GoogleCoordinateService

  def get_coordinates(location)
    get_json("/maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")[:results][0][:geometry][:location]
  end

  private

  def conn
    Faraday.new(url:"https://maps.googleapis.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
