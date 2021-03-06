require 'rails_helper'

describe 'requests' do
  before(:each) do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").to_return(body: File.read("./spec/fixtures/google_response.json"))

    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/39.7392358,-104.990251").to_return(body: File.read("./spec/fixtures/darksky_response.json"))
  end

  it 'exists' do
    VCR.use_cassette("giphy_forecast_request") do
      get "/api/v1/forecast?location=denver,co"
      expect(response).to be_successful
    end
  end

  it 'response' do
    VCR.use_cassette("giphy_forecast_request") do
      get "/api/v1/forecast?location=denver,co"

      parsed = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(parsed).to be_a(Hash)

      expect(parsed).to have_key(:daily)
      expect(parsed).to have_key(:hourly)
      expect(parsed).to have_key(:currently)

      expect(parsed[:daily].first).to have_key(:gif_url)
      expect(parsed[:daily].count).to eq(8)
      expect(parsed[:hourly].count).to eq(8)
    end
  end
end
