require 'rails_helper'

describe 'requests' do
  before(:each) do
    location = "denver,co"
    get "/api/v1/gifs?location=#{location}"
  end

  it 'exists' do
    expect(response).to be_successful
  end

  it 'response' do
    get "/api/v1/gifs?location=denver,co"

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to be_a(Hash)

  end
end
