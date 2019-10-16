class PostNotesSerializer < ActiveModel::Serializer
    attributes :id, :content, :topics, :user, :notes
    
    def topics
      self.object.topics.map do |t|
        TopicSerializer.new(t)
      end
    end
  
    def user
      PostUserSerializer.new(self.object.user)
    end
  
end
