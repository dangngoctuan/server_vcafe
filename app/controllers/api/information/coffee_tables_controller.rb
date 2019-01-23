class Api::Information::CoffeeTablesController < Api::BaseController
  before_action :check_user, only: [:index, :add_tables, :remove_tables]
  def index
    return respon_to_failed unless @user.present?
    render json: CoffeeTable.handle_list_coffee_tables(@user)
  end

  def add_tables
    return respon_to_message_failed unless @user.present? || params[:quantity].blank?
    CoffeeTable.add_tables(@user, params[:quantity].to_i)
    respon_to_message_success
  end

  def remove_tables
    return respon_to_message_failed unless @user.present? || params[:quantity].blank?
    CoffeeTable.remove_tables(@user, params[:quantity].to_i)
    respon_to_message_success
  end
end
