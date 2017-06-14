class Resource < ApplicationRecord
  belongs_to :language
  has_many :resource_topics
  has_many :topics, through: :resource_topics
end
