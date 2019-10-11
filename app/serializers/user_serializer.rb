class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :subscriptions
  has_many :posts
  has_many :recieved_notes
  has_many :subscriptions
end
