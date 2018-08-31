class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :genre_ids, :user_ids
  # has_many :users, serializer: BookUserSerializer
end
