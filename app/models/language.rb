class Language < ApplicationRecord
  has_many :resources

  validates :name, presence: true
end
