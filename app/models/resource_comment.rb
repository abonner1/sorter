class ResourceComment < ApplicationRecord
  belongs_to :resource
  belongs_to :comment
end
