class Workout < ApplicationRecord
  belongs_to :program
  has_many :exercises, dependent: :destroy
  has_many :sessions
  accepts_nested_attributes_for :exercises
end
