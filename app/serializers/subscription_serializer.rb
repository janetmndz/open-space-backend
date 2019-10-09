class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id
  has_one :topic
  has_one :user
end
