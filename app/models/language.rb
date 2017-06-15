class Language < ApplicationRecord
  has_many :resources
  has_many :courses

  validates :name, presence: true
  validates :name, uniqueness: true
end
