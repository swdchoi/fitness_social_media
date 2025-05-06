class RemoveR1ToR6FromSessions < ActiveRecord::Migration[8.0]
  def change
    remove_column :exercises, :r1, :integer
    remove_column :exercises, :r2, :integer
    remove_column :exercises, :r3, :integer
    remove_column :exercises, :r4, :integer
    remove_column :exercises, :r5, :integer
    remove_column :exercises, :r6, :integer
    add_column :exercises, :reps, :string
  end
end
