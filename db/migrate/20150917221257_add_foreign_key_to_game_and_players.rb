class AddForeignKeyToGameAndPlayers < ActiveRecord::Migration
  def change
  	add_column :games, :player_id, :integer
    add_column :players, :game_id, :integer
  end
end
