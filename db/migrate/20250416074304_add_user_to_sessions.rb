class AddUserToSessions < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :user_id, :integer
  end
end
