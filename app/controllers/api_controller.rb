class ApiController < ApplicationController
  before_action :set_default_format
  before_action :authenticate_token!

  attr_reader :current_user

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload["sub"])
  rescue
    render json: {errors: ["Invalid token"]}, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end
end
