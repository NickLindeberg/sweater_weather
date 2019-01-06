require 'rails_helper'

describe 'request' do
  it 'user can sign up' do
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/users", :params => {"email"=>"whatever@example.com",
       "password"=>"password",
       "password_confirmation"=>"password",
       "controller"=>"api/v1/users",
       "action"=>"create",
       "user"=>{"email"=>"whatever@example.com"}}, :headers => headers

    expect(request.params.keys).to include("email")
    expect(request.params.keys).to include("password")
    expect(request.params.keys).to include("password_confirmation")
    expect(request.params.keys).to include("controller")
    expect(request.params.keys).to include("action")
    expect(request.params.keys).to include("user")
    expect(response).to be_successful

    response_hash = JSON.parse(response.body)

    expect(response_hash.keys).to include("api_key")
  end

  it 'user can sign in' do
    user = User.create(email: "nick@nick.com", password: "2345", api_key: "6780")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    user_data = { email: user.email, password: user.password}

    post "/api/v1/sessions", params: user_data, headers: headers

    response_hash = JSON.parse(response.body)
    expect(response).to be_successful


  end
end
