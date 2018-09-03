class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary
  has_many :users, serializer: UserSerializer

  attribute :users do
      array = object.user_ids.map do |user_id|
        User.find_by(id: user_id).username
      end
      array.uniq
    end

  attribute :genres do
      array = object.genre_ids.map do |genre_id|
        Genre.find_by(id: genre_id).name
      end
      array.uniq
    end
end
