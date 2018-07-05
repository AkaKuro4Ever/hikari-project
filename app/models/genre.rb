class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: :true
end
