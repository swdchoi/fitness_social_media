class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :desc
      t.integer :program_id

      t.timestamps
    end
  end
end
