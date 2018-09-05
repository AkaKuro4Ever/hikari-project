class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content

  attribute :user do
    object.user.username
  end

  belongs_to :book
end
