class AddPlayersToGame < ActiveRecord::Migration
  def change
    add_column :games, :player1, :string
    add_column :games, :player2, :string
    add_column :games, :player3, :string
    add_column :games, :player4, :string
  end
end
