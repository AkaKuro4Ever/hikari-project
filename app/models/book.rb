class Book < ApplicationRecord
  has_many :comments
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :user_books
  has_many :users, through: :user_books

  validates :title, presence: true
  validates :user_ids, presence: true
end
