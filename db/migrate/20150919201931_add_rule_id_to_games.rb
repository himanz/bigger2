class AddRuleIdToGames < ActiveRecord::Migration
  def change
  	add_column :games, :rule_id, :integer
  end
end
