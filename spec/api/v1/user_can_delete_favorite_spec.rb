require 'rails_helper'

describe 'request' do
  it 'lets user delete a favorite' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    favorite_1 = user.favorites.create(location: "denver,co")
    favorite_2 = user.favorites.create(location: "golden,co")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    expect(Favorite.count).to eq(2)

    delete "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "6780",
       "controller"=>"api/v1/favorites",
       "action"=>"destroy"}, :headers => headers

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(Favorite.count).to eq(1)
    expect(Favorite.first).to eq(favorite_2)
  end

  it 'does not let user delete favorite if api key is wrong' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    favorite_1 = user.favorites.create(location: "denver,co")
    favorite_2 = user.favorites.create(location: "golden,co")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    delete "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "wrong",
       "controller"=>"api/v1/favorites",
       "action"=>"destroy"}, :headers => headers

    expect(response.status).to eq(401)
    expect(Favorite.count).to eq(2)
    expect(Favorite.first).to eq(favorite_1)
  end
end
