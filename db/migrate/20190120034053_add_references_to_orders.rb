class AddReferencesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :coffee_table
    add_reference :orders, :menu
  end
end
