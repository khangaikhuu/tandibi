class User < ApplicationRecord
  validates :email, uniqueness:true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: true
  validates :first_name, presence: true

  has_many :posts
  has_many :friends, through: :bonds


  has_many :bonds
  has_many :followings,
           -> { where("bonds.state = ?", Bond::FOLLOWING) },
           through: :bonds,
           source: :friend

  has_many :follow_requests,
           -> { where("bonds.state = ?", Bond::REQUESTING) },
           through: :bonds,
           source: :friend
  has_many :inward_bonds,
           class_name: "Bond",
           foreign_key: :friend_id
  has_many :followers,
           -> { where("bonds.state = ?", Bond::FOLLOWING) },
           through: :inward_bonds,
           source: :user
  before_save :ensure_proper_name_case

  private

    def ensure_proper_name_case
      self.first_name = first_name.capitalize
    end
end
