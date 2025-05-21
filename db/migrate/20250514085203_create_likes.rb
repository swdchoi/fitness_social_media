class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :session_id], unique: true
  end
end
