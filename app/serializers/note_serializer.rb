class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :username


  def username
    self.object.user.username
  end


end
