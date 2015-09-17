class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :players
      t.integer :amount_per_card

      t.timestamps null: false
    end
  end
end
