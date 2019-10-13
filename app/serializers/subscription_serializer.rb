class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :topic_id, :topic_type
  has_one :topic
  has_one :user

  def topic_type
    self.object.topic.topic_type
  end

end
