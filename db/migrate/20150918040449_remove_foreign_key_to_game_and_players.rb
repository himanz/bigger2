class RemoveForeignKeyToGameAndPlayers < ActiveRecord::Migration
  def change
  	remove_column :games, :player_id
    remove_column :players, :game_id
  end
end
