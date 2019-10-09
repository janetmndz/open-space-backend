class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy
    # These are the notes a User has made to ANOTHER user
    has_many :notes, dependent: :destroy
    # These are the notes a User has receieved THROUGH their own post
    has_many :recieved_notes, through: :posts, :source => :notes

end
