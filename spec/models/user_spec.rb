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
require 'rails_helper'

RSpec.describe User, type: :model do
  def create_a_user(email: "#{SecureRandom.hex(4)}@example.org")
     User.create!(first_name: "Adam", email: email, username: SecureRandom.hex(4))
  end
  
  describe "#valid?" do
    it "is valid when email is unique" do
      create_a_user
      user = User.new
      user.email = "adam@example.org"
      expect(user.valid?).to be true
    end
  end
end
