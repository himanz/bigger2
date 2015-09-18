class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.boolean :winner_points
      t.integer :winner_points_amount
      t.integer :line1_min
      t.integer :line1_max
      t.integer :line1_multiplier
      t.integer :line2_min
      t.integer :line2_max
      t.integer :line2_multiplier
      t.integer :line3_min
      t.integer :line3_max
      t.integer :line3_multiplier
      t.integer :line4_min
      t.integer :line4_max
      t.integer :line4_multiplier
      t.integer :line5_min
      t.integer :line5_max
      t.integer :line5_multiplier

      t.timestamps null: false
    end
  end
end
