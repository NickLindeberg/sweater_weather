require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}

  it {should have_many(:user_favorites)}
  it {should have_many(:favorites).through(:user_favorites)}
end
