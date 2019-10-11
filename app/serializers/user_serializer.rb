class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :subscriptions
  has_many :posts
  has_many :recieved_notes
  
  def subscriptions
    self.object.subscriptions.map do |s|
      TopicSerializer.new(s.topic)
    end
  end
end
