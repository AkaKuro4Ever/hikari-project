class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :comments

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'FollowingFollower'
  has_many :following, through: :following_relationships, source: :following

  has_secure_password

  before_create :validate_user
  before_update :validate_updated_user

  def validate_user
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
  end

  def validate_updated_user
    self.username.present?
    self.password.present?
    self.password_confirmation.present? &&  self.password_confirmation == self.password
  end

end
