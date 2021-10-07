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
      user.first_name = "khangaikhuu"
      user.email = "adam@example.org"
      expect(user.valid?).to be true
    end
    it "is invalid if the email is taken" do
      create_a_user(email: "adam@example.org")

      user1 = create_a_user
      user2 = create_a_user
      expect(user2.email).not_to be user1.email
      expect(user2).to be_valid
    end
    it "is invalid if the username is already taken" do
      user = create_a_user
      another_user = create_a_user

      expect(another_user).to be_valid
      another_user.username = user.username
      expect(another_user).not_to be_valid
    end
    it "is invalid if user's first name is blank" do
      user = create_a_user
      expect(user).to be_valid

      user.first_name = ""
      expect(user).not_to be_valid

      user.first_name = nil
      expect(user).not_to be_valid
    end
  end
end
