class CoordinatesAdapter

  def build(location)
    service = GoogleCoordinateService.new
    service.get_coordinates(location)
  end

end
