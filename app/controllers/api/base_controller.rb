class Api::BaseController < ActionController::Base
  def check_user
    @user = User.find_by(email: params[:email])
  end

  def respon_to_failed
    render json: { status: false }
  end

  def respon_to_message_failed
    render json: { message: 'Action Failed' }
  end

  def respon_to_message_success
    render json: { message: 'Update Successfull' }
  end
end
