class CreateTotalBills < ActiveRecord::Migration[5.1]
  def change
    create_table :total_bills do |t|

      t.timestamps
    end
  end
end
