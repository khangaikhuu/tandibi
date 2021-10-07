class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
end
