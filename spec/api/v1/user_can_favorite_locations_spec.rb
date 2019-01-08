require 'rails_helper'

describe 'request' do
  it 'lets user favorite a location' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "6780",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => headers

    expect(request.params.keys).to include("location")
    expect(request.params.keys).to include("api_key")

    expect(response).to be_successful
    expect(Favorite.last.location).to eq('denver,co')
    expect(response.status).to eq(204)
  end

  it 'lets user errors out if user not in system' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    post "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "wrong",
       "controller"=>"api/v1/favorites",
       "action"=>"create"}, :headers => headers

    expect(request.params.keys).to include("location")
    expect(request.params.keys).to include("api_key")

    expect(response.status).to eq(401)
  end
end
