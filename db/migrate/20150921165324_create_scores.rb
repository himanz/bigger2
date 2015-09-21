class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :cards_left
      t.integer :points
      t.integer :hand_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
