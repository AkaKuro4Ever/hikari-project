class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :comments

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'FollowingFollower'
  has_many :following, through: :following_relationships, source: :following

  has_secure_password

  validates :username, presence: true, uniqueness: true, on: :create
  before_create validates :email, presence: true, uniqueness: true, on: :create
  before_create validates :password, presence: true, confirmation: true, on: :create
  before_create validates :password_confirmation, presence: true, on: :create

  # validates_presence_of :password, :on => :create, :if => :password_required
  # def validate_updated_user
  #   self.username.present?
  #   self.password.present?
  #   self.password_confirmation.present? &&  self.password_confirmation == self.password
  # end

  def user_book_ids
    self.books.uniq.collect do |book|
      book.id
    end
  end

  def author_list
    self.map do |user_id|  User.find_by(id: user_id).username
    end
  end
end
