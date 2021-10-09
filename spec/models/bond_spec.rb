# == Schema Information
#
# Table name: bonds
#
#  id         :bigint           not null, primary key
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_bonds_on_user_id_and_friend_id  (user_id,friend_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (friend_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Bond, type: :model do
  describe "#valid?" do
    it "should validate the state correctly" do
      friend = User.new
      friend.save
      user = User.new
      user.save
      bond = Bond.new(user: user,
                      friend: friend)
      
      expect(bond).not_to be_valid

      Bond::STATES.each do |state|
        bond.state = state
        expect(bond).to be_valid
      end
    end
  end

  describe "#save" do
    context "when complete data is given" do
      it "can be persisted" do
        user = User.create email: "e1@example.org",
                           first_name: "Edwin",
                           username: "e1"
        
        friend = User.create email: "a1@example.org",
                             first_name: "Adam",
                             username: "a1"
        
        bond = Bond.new(
          user: user,
          friend: friend,
          state: Bond::REQUESTING
          )
        bond.save
        expect(bond).to be_persisted
        expect(bond.user).to eq user
        expect(bond.friend).to eq friend
     end
   end
 end
end
