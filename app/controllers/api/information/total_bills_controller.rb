class Api::Information::TotalBillsController < Api::BaseController
  before_action :check_user, only: [:index, :checkout]

  def index
    return respon_to_message_failed if @user.blank?
    current_table = JSON.parse(params[:table_total_bill])
    results = CoffeeTable.total_bills(current_table, @user)
    render json: results
  end

  def checkout
    current_table = JSON.parse(params[:table_total_bill])
    total_bills = params[:total_bills]
    TotalBill.checkout_payment(@user, current_table, total_bills)
    render json: { message: 'Checkout Successfull' }
  end
end
