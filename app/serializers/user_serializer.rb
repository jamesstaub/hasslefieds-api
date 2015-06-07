class UserSerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :full_name, :username, :token

  has_many :posts
  has_many :replies

end
