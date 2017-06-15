class CourseLanguage < ApplicationRecord
  belongs_to :course
  belongs_to :language
end
