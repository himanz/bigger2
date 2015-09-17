class ChangeAmountPerCardToDecimal < ActiveRecord::Migration
  def change
  	change_column :games, :amount_per_card, :decimal
  end
end
