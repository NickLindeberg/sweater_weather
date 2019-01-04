require 'rails_helper'

describe GoogleCoordinateService do
  it 'exists' do
    coordinates_service = GoogleCoordinateService.new
    expect(coordinates_service).to be_a(GoogleCoordinateService)
  end
  it 'returns coordinates' do
    VCR.use_cassette("google_coordinates_service_spec") do
      location = "Denver, CO"
      coordinates_service = GoogleCoordinateService.new
      expect(coordinates_service.get_coordinates(location)).to eq({"lat": 39.7392358, "lng": -104.990251})
    end
  end
end
