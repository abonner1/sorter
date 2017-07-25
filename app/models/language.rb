class Language < ApplicationRecord
  has_many :resource_languages
  has_many :resources, through: :resource_languages

  validates :name, presence: true
  validates :name, uniqueness: true
end
