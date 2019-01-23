class Api::Information::MenusController < Api::BaseController
  before_action :check_user, only: :sort_popular

  def index
    render json: Menu.all
  end

  def sort_popular
    render json: Menu.all.sort_by(&:ordering).reverse
  end
end
