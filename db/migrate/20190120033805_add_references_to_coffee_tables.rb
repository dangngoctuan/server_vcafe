class AddReferencesToCoffeeTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :coffee_tables, :user
  end
end
