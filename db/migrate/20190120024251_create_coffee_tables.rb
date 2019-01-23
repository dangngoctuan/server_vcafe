class CreateCoffeeTables < ActiveRecord::Migration[5.1]
  def change
    create_table :coffee_tables do |t|
      t.integer "ordering", default: 0

      t.timestamps
    end
  end
end
