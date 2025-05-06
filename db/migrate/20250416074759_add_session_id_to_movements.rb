class AddSessionIdToMovements < ActiveRecord::Migration[8.0]
  def change
    add_column :movements, :session_id, :integer
  end
end
