class TotalBill < ApplicationRecord
  belongs_to :coffee_table
  belongs_to :user

  class << self
    def checkout_payment(user, table, total)
      current_table = CoffeeTable.find_by(id: table['id'])
      list_order = current_table.orders
      TotalBill.create([{total: total.to_i, user_id: user.id, coffee_table_id: table['id']}])
      current_table.update(active: false)
      list_order.delete_all
    end
  end
end
