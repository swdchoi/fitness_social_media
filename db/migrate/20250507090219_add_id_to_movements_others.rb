class AddIdToMovementsOthers < ActiveRecord::Migration[8.0]
  def change
    add_reference :sessions, :workout, foreign_key: true
    add_reference :movements, :exercise, foreign_key: true
  end
end
