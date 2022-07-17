class UsersController < ApplicationController
  before_action :set_user, only: %i[user_id update]

  def users
    @users = User.all
    render json: @users
  end

  def user_id
    render json: @user
  end

  def create
    @user = User.new user_params
  end

  def update
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by id: params[:id]
  end
end


