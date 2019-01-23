class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :beverages
      t.integer :price, default: 0
      t.integer :ordering, default: 0

      t.timestamps
    end
  end
end
