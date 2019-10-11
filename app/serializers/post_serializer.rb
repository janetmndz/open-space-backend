class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :topics, :user
  has_many :topics
  has_one :user
end
