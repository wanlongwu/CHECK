class Exercise < ApplicationRecord
  has_many :programs
  validates :name, uniqueness: true, presence: true
  validates :content
  validates :catergory
end
