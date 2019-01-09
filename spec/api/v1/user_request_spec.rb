require 'rails_helper'

describe 'request' do
  it 'user can sign up' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/users", :params => {"email"=>"whatever@example.com",
       "password"=>"password",
       "password_confirmation"=>"password",
       "controller"=>"api/v1/users",
       "action"=>"create"}, :headers => headers

    expect(request.params.keys).to include("email")
    expect(request.params.keys).to include("password")
    expect(request.params.keys).to include("password_confirmation")

    expect(response).to be_successful

    response_hash = JSON.parse(response.body, symbolize_names: true)

    expect(response_hash.keys).to include(:api_key)
    expect(response.status).to eq(201)
  end

  it 'user can sign in' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    user_data = { email: user.email, password: user.password}

    post "/api/v1/sessions", params: user_data, headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(200)

    response_hash = JSON.parse(response.body, symbolize_names: true)
    expect(response_hash[:data][:attributes]).to include(:api_key)
  end

  it 'returns 401 if email is incorrect' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    user_data = { email: "nick@rick.com", password: user.password}

    post "/api/v1/sessions", params: user_data, headers: headers

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
