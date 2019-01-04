require 'rails_helper'

describe DarkskyService do
  it 'exists' do
    darksky_service = DarkskyService.new
    expect(darksky_service).to be_a(DarkskyService)
  end

  it 'gives forecast for coordinates' do
    VCR.use_cassette("darksky_service_spec") do
      darksky_service = DarkskyService.new
      data = darksky_service.get_city_forecast(39.7392358,-104.990251)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:currently)
      expect(data).to have_key(:hourly)
      expect(data).to have_key(:daily)
    end
  end
end
