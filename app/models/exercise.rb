class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :movements
end
