class RemoveCardLeftPointsAndPlayerIdFromHands < ActiveRecord::Migration
  def change
  	remove_column :hands, :card_left
    remove_column :hands, :points
    remove_column :hands, :player_id
  end
end
