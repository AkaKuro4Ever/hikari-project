class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :comments

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
