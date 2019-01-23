class Api::Information::UsersController < Api::BaseController
  before_action :check_user, only: [:revenue_months, :revenue_days]
  def index
    User.create(email: params[:email])
    render json: { status: true, email: User.last.email }
  end

  def revenue_months
    results = User.data_revenue_months(@user)
    render json: results
  end

  def revenue_days
    results = User.data_revenue_days(@user)
    render json: results
  end
end
