class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :resources

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
end
