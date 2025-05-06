class Workout < ApplicationRecord
  belongs_to :program
  has_many :exercises, dependent: :destroy
  accepts_nested_attributes_for :exercises
end
