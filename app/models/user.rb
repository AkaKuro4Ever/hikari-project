class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :comments

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'FollowingFollower'
  has_many :following, through: :following_relationships, source: :following

  has_secure_password

  before_create validates :username, presence: true, uniqueness: true
  before_create validates :email, presence: true, uniqueness: true
  before_create validates :password, presence: true, confirmation: true
  before_create validates :password_confirmation, presence: true

  before_update :validate_updated_user


  def validate_updated_user
    self.username.present?
    self.password.present?
    self.password_confirmation.present? &&  self.password_confirmation == self.password
  end

end
