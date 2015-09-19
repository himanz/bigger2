class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :card_left
      t.integer :points
      t.integer :game_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
