# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  is_public  :boolean
#  last_name  :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
FactoryBot.define do
  factory :user do
    username { SecureRandom.hex(3) }
    first_name { ["Adam", "Sam", "Mike"].sample }
    last_name { ["Soesanto", "Yamashita", "de Flaire"].sample }
    email { "#{SecureRandom.hex(4)}@example.org" }
    is_public { true }

  end
end
