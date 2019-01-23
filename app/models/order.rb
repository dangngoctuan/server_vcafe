class Order < ApplicationRecord
  belongs_to :coffee_table
  belongs_to :menu

  class << self
    def add_order_to_table(list_menus, table)
      list_order = []
      list_menus.each do |menu|
        list_order << { coffee_table_id: table['id'], menu_id: menu['id'], quantity: menu['quantity'] }
      end
      array_ids = list_menus.map { |arr| arr['id'] }
      list_menus_order = Menu.where(id: array_ids)
      list_menus_order.each_with_index do |menu, index|
        menu.update(ordering: menu.ordering + list_menus[index]['quantity'])
      end
      CoffeeTable.find_by(id: table['id']).update(active: true)
      Order.create(list_order)
    end
  end
end
