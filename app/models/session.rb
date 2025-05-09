class Session < ApplicationRecord
  has_many :movements, dependent: :destroy
  accepts_nested_attributes_for :movements
  belongs_to :user
  belongs_to :workout
end
