class AddFieldsToCoffeeTables < ActiveRecord::Migration[5.1]
  def change
    add_column :coffee_tables, :active, :boolean, default: false
  end
end
