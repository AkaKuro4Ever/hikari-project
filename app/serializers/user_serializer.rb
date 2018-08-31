class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username
  has_many :books
  has_many :following
end
