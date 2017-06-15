class Language < ApplicationRecord
  has_many :resources
  has_many :course_languages
  has_many :courses, through: :course_languages

  validates :name, presence: true
  validates :name, uniqueness: true
end
