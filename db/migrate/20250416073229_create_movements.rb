class CreateMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.text :notes
      t.string :work

      t.timestamps
    end
  end
end
