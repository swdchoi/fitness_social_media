class Program < ApplicationRecord
  has_many :workouts, dependent: :destroy
  accepts_nested_attributes_for :workouts
  belongs_to :user
end
