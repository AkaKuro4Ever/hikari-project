class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres
end

#add foreign key label for reader vs author
#Ex: AirBNB (Host/hostee) or Instagram
