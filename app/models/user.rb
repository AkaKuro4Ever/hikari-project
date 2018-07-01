class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :comments

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'FollowingFollower'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'FollowingFollower'
  has_many :following, through: :following_relationships, source: :following


  # has_many :followers, class_name: 'FollowingFollower', foreign_key: :following_id
  # has_many :follows, through: :followers, source: :follower

  #has_many :following, class_name: 'FollowingFollower', foreign_key: :follower_id

# ActiveRecord::HasManyThroughSourceAssociationNotFoundError: Could not find the source association(s) :following_followers in model FollowingFollower. Try 'has_many :followers, :through => :follower_relationships, :source => <name>'. Is it one of follower or following?
#You don't need the foreign_keys for it to work
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
