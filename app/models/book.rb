class Book < ApplicationRecord
  has_many :comments
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :user_books
  has_many :users, through: :user_books
  accepts_nested_attributes_for :users
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'FollowingFollower'
  has_many :followers, through:  :follower_relationships, source: :follower

  validates :title, presence: true
  #ADD VALIDATION SO AN AUTHOR CAN'T HAVE 2 BOOKS WITH THE SAME TITLE
  validates :user_ids, presence: true

  def self.favs
     includes(:genres).where(genres: {name: "Yaoi"})
  end
end
