class AddFieldsToTotalBills < ActiveRecord::Migration[5.1]
  def change
    add_column :total_bills, :total, :integer, default: 0
  end
end
