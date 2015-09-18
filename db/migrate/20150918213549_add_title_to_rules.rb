class AddTitleToRules < ActiveRecord::Migration
  def change
    add_column :rules, :title, :string
  end
end
