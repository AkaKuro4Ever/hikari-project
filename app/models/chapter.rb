class Chapter < ApplicationRecord
  belongs_to :book

  validates :content, presence: true
  validates :book_id, presence: true
  # validates :user_ids, presence: true
end
