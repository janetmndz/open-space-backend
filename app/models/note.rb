class Note < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validate :no_anger
  validate :no_shoulds

  def no_anger
    tone = analyze_tone(self.content)
    # byebug
    if (tone.map{|t| t["tone_id"]}.include?("anger"))
      errors.add(:content, "has been detected to have a bit of anger...")
    end
    if (tone.filter{|t_obj| t_obj["tone_id"] === "sadness" && t_obj["score"] > 0.5}.count != 0)
      errors.add(:content, "had been detected to sounds pretty upsetting and sad...")
    end
  end

  def no_shoulds
    if (self.post.topics.filter{|t| t.topic_type === "mental health"}.count != 0)
      if(self.content.downcase.include?("you" && "should"))
        errors.add(:content, "has a 'should' sentence and is labeled 'mental health'.\nPosts with this label doesn't accept 'should' suggestions.")
      end
    end
  end

  private 

  def analyze_tone(text)
      tone = TONE_ANALYZER.tone(
          tone_input: {text: text},
          content_type: "application/json"
      )
      tone.result["document_tone"]["tones"]
  end

end
