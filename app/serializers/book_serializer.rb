class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary
  # has_many :users, serializer: UserSerializer

  attribute :users do
    object.user_ids.uniq.map do |user_id|
      User.find_by(id: user_id).username
    end
  end

  attribute :genres do
    object.genre_ids.uniq.map do |genre_id|
      Genre.find_by(id: genre_id).name
    end
  end
end
