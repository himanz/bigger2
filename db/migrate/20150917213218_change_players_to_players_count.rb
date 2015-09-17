class ChangePlayersToPlayersCount < ActiveRecord::Migration
  def change
  	rename_column :games, :players, :players_count
  end
end
