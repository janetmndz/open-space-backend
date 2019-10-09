class Topic < ApplicationRecord
    has_many :post_topics
    has_many :subscriptions
end
