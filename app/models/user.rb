 class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_secure_password

  def self.create_user(params)
    hash = {}
    hash[:email] = params["email"]
    hash[:password] = params["password"]
    hash[:password_confirmation] = params["password_confirmation"]
    hash[:api_key] = SecureRandom.uuid
    User.create(hash)
  end

end
