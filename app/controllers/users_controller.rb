class UsersController < ApplicationController

  def users
    @users = User.all
    render json: @users
  end

  def user_id
    @user = User.find_by id: params[:id]
    render json: @user
  end

  def create
    @user = User.new user_params
  end

  def update
    @user = User.find_by id: params[:id]
  end

  def delete
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end


