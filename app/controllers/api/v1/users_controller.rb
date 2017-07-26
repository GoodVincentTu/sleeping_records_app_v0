class Api::V1::UsersController < ApiController
  def index
    render json: all_users
  end

  private

  def all_users
    User.where.not(id: current_user.id)
  end
end
