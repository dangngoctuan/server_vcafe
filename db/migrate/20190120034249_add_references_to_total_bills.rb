class AddReferencesToTotalBills < ActiveRecord::Migration[5.1]
  def change
    add_reference :total_bills, :user
    add_reference :total_bills, :coffee_table
  end
end
