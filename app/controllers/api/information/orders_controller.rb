class Api::Information::OrdersController < Api::BaseController
  before_action :check_user, only: :index
  def index
    return respon_to_message_failed if @user.blank?
    list_menus = params[:list_menus].map { |menu| JSON.parse(menu) }
    current_table = JSON.parse(params[:current_table])
    Order.add_order_to_table(list_menus, current_table)
    render json: { message: 'Order Successfull' }
  end
end
