class ChangeStatusToIntegerInFriendships < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :friendships, :friends
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
