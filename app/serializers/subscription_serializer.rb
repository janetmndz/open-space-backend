class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :topic_id
  has_one :topic
  has_one :user
end
