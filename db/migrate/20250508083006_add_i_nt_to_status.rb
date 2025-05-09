class AddINtToStatus < ActiveRecord::Migration[8.0]
  def change
    change_column :friendships, :status, :integer
  end
end
