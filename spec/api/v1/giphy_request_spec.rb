require 'rails_helper'

describe 'requests' do
  before(:each) do
    location = "denver,co"
    get "/api/v1/gifs?location=#{location}"
  end

  it 'exists' do
    expect(response).to be_successful
  end
end
