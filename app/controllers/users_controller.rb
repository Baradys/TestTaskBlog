class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[show create update destroy]

  def index
    from = params[:start_date].present? ? params[:start_date] : Date.new(1970, 01, 01)
    to = params[:end_date].present? ? params[:end_date] : Date.tomorrow
    @users = User.where(date: from..to).includes(:posts, :comments)
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: params
    else
      render json: {
        error: "User not saved"
      }
    end
  end

  def update
    if @user.update(
      user_params
    )
      render json: params
    else
      render json: {
        error: "User not updated"
      }
    end
  end

  def destroy
    if @user.destroy
      render json: User.all
    else
      render json: {
        error: "User not deleted"
      }
    end
  end

  private

  def user_params
    params.permit(:name)
  end

  def set_user
    @user = User.find_by id: params[:id]
  end
end


