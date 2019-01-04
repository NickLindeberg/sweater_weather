require 'rails_helper'

describe 'requests' do
  it 'response' do
    VCR.use_cassette("giphy_request_spec") do
      get "/api/v1/gifs?location=denver,co"

      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
    end
  end
end
