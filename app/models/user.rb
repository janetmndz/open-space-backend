class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
    # These are the notes a User has made to ANOTHER user
    has_many :notes, dependent: :destroy
    # These are the notes a User has receieved THROUGH their own post
    has_many :recieved_notes, through: :posts, :source => :notes
    has_many :subscriptions

    validates :email, uniqueness: true
    validate :real_email

    def real_email
        if !(self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
            errors.add(:email, "is not a valid email")
        end
    end

end
