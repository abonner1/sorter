class Course < ApplicationRecord
  has_many :enrolled_courses
  has_many :users, through: :enrolled_courses
  has_many :course_resources
  has_many :resources, through: :course_resources

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
