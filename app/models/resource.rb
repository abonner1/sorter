class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :resource_topics
  has_many :topics, through: :resource_topics

  validates :title, presence: true
  validates :url, presence: true

  scope :by_language, -> {includes(:language).order("languages.name ASC")}
  scope :favorited, -> {where(favorited: true)}
end
