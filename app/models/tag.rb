class Tag < ApplicationRecord
  has_many :resource_tags
  has_many :resources, through: :resource_tags

  validates :name, presence: true
  validates :name, uniqueness: true
end
