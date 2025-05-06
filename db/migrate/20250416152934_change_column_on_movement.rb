class ChangeColumnOnMovement < ActiveRecord::Migration[8.0]
  def change
    change_column :movements, :work, :json
  end
end
