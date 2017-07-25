class ResourceLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :resource
end
