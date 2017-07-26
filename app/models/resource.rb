class Resource < ApplicationRecord
  belongs_to :user
  has_many :resource_languages
  has_many :languages, through: :resource_languages
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  has_many :comments

  validates :title, presence: true
  validates :url, presence: true
  validates :url, uniqueness: true

  # SCOPES NO LONGER WORK
  scope :by_language, -> {includes(:language).order("languages.name ASC")}
  scope :favorited, -> {where(favorited: true)}

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :languages

  def user_name
    self.user.username
  end

  def language_names
    self.languages.collect do |language|
      language.name
    end
  end

  def add_user(current_user)
    self.user = current_user
  end

  def tags_attributes=(tags_attributes)
    tags_attributes.values.each do |tag_attribute|
      self.tags.find_or_initialize_by(tag_attribute) if tag_attribute[:name].present?
    end
  end
end
