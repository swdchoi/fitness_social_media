class Session < ApplicationRecord
  has_many :movements, dependent: :destroy
  accepts_nested_attributes_for :movements
  belongs_to :user
  belongs_to :workout, optional: true

  has_many :likes
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy
end
