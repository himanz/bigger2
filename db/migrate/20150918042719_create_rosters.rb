class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :game_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
