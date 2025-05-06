class CreatePrograms < ActiveRecord::Migration[8.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.text :desc
      t.integer :user_id

      t.timestamps
    end
  end
end
