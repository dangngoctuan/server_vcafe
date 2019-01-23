class CoffeeTable < ApplicationRecord
  has_many :total_bills
  has_many :orders
  belongs_to :user, optional: true

  class << self
    def handle_list_coffee_tables(user)
      user.coffee_tables.sort_by(&:ordering)
    end

    def add_tables(user, quantity)
      results = []
      max_ordering = max_ordering(user)
      array_list = (1..quantity).to_a
      array_list.each_with_index() do |arr, index|
        ordering = index + max_ordering
        results << { user_id: user.id,  ordering: ordering }
      end
      CoffeeTable.create(results)
    end

    def remove_tables(user, quantity)
      list_coffee_tables = user.coffee_tables
      last_table = list_coffee_tables.last.ordering
      list_ordering = ((last_table - quantity + 1)..last_table).to_a
      list_coffee_tables.where(ordering: list_ordering).delete_all
    end

    def max_ordering(user)
      where(user_id: user.id).maximum(:ordering).to_i + 1
    end

    def total_bills(table, user)
      current_table = CoffeeTable.find_by(id: table['id'])
      list_order = current_table.orders
      attributes_menus = {}
      array_list_money = []
      list_order.each do |order|
        menu = order.menu
        attributes_menus[order.id] = { beverages: menu.beverages, price: menu.price, quantity: order.quantity }
        array_list_money << menu.price * order.quantity
      end
      total_bills = array_list_money.sum
      { attributes_menus: attributes_menus.values, total_bills: total_bills }
    end
  end
end
