class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, confirmation: true
  has_secure_password
  has_secure_token :api_key # default 24 characters
end

# validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
# constant built into URI in the standard ruby library
