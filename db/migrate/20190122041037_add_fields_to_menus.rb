class AddFieldsToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :quantity, :integer, default: 0
  end
end
