require 'rails_helper'

describe 'request' do
  it 'lets user see a list of favorite locations' do
    VCR.use_cassette("favorite_index_test") do
      user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
      favorite_1 = user.favorites.create(location: "denver,co")
      favorite_2 = user.favorites.create(location: "golden,co")

      headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

      get "/api/v1/favorites", :params => {"location"=>"Denver, CO",
        "api_key": "6780",
         "controller"=>"api/v1/favorites",
         "action"=>"index",
         "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

      expect(response).to be_successful
      expect(response.status).to eq(200)
      parsed = JSON.parse(response.body)
      expect(parsed.first.keys[0]).to eq("location")
      expect(parsed.first.keys[1]).to eq("current_weather")
      expect(parsed.last.keys[0]).to eq("location")
      expect(parsed.last.keys[1]).to eq("current_weather")

      expect(parsed.first["location"]).to eq("denver,co")
      expect(parsed.last["location"]).to eq("golden,co")
    end
  end

  it 'erros out if user is incorrect' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    favorite_1 = user.favorites.create(location: "denver,co")
    favorite_2 = user.favorites.create(location: "golden,co")

    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }

    get "/api/v1/favorites", :params => {"location"=>"Denver, CO",
      "api_key": "wrong",
       "controller"=>"api/v1/favorites",
       "action"=>"index",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
