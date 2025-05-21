class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :programs
  has_many :sessions

  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :likes
  has_many :liked_posts, through: :likes, source: :session

  has_many :comments, dependent: :destroy
end
