class CreateExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :r1
      t.integer :r2
      t.integer :r3
      t.integer :r4
      t.integer :r5
      t.integer :r6
      t.integer :workout_id

      t.timestamps
    end
  end
end
