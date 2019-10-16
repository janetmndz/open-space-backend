class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :subscriptions, :posts
  # has_many :posts
  # has_many :recieved_notes
  has_many :subscriptions
  def posts
    self.object.posts.map do |p|
      PostNotesSerializer.new(p)
    end
  end
end
