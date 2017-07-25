class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :content, presence: true
end
