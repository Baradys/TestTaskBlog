class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[show create update destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new user_params
    @user.save
    render json: params
  end

  def update
    @user.update(
      user_params
    )
    render json: params
  end

  def destroy
    @user.destroy
    render json: User.all
  end

  private
  def user_params
    params.permit(:name)
  end

  def set_user
    @user = User.find_by id: params[:id]
  end
end


