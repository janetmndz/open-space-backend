class Post < ApplicationRecord
  belongs_to :user
  has_many :notes
  has_many :post_topics
  has_many :topics, through: :post_topics

  validates :content, presence: true

  def topic_types
    self.topics.topic_type
  end

end
