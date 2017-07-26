class Api::V1::UsersController < ApiController
  def index
    render json: all_users
  end

  def following
    users = User.where(id: current_user.following.pluck(:followed_id))
    render json: users
  end

  def following_records
    following_user = current_user.following.find_by(followed_id: params[:id]).followed
    records = following_user.sleeping_records.sufficient_records.try(:order_by_duration)
    render json: records
  end

  def follow
    user = User.find(params[:id])
    current_user.follow(user)
    render json: {}, status: 204
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(user)
    render json: {}, status: 204
  end

  private

  def all_users
    User.where.not(id: current_user.id)
  end
end
