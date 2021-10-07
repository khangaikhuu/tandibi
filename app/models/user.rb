class User < ApplicationRecord
  validates :email, uniqueness:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: true
  validates :first_name, presence: true
end
