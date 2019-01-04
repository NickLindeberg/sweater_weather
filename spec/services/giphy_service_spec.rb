require 'rails_helper'

describe GiphyService do
  it 'exists' do
    darksky_service = GiphyService.new
    expect(darksky_service).to be_a(GiphyService)
  end

  it 'gives forecast for coordinates' do
    VCR.use_cassette("giphy_service") do
      giphy = GiphyService.new
      data = giphy.get_gif("pizza")

      expect(data).to be_a(Hash)
    end
  end
end
