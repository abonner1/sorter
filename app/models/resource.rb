class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :resource_topics
  has_many :topics, through: :resource_topics
  has_many :course_resources
  has_many :courses, through: :course_resources

  validates :title, presence: true
  validates :url, presence: true

  scope :by_language, -> {includes(:language).order("languages.name ASC")}
  scope :favorited, -> {where(favorited: true)}

  accepts_nested_attributes_for :topics

  def user_name
    self.user.username
  end

  def language_name
    self.language.name
  end

  def topics_attributes=(topics_attributes)
    topics_attributes.values.each do |topic_attribute|
      self.topics.find_or_initialize_by(topic_attribute) if topic_attribute[:name].present?
    end
  end
end
