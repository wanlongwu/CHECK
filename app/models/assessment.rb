class Assessment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :programs
end
