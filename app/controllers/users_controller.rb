class UsersController < ApplicationController
  before_action :set_user, only: %i[user_id update]

  def users
    @users_after = User.created_after("2000-20-02")
    @users_before = User.created_before("2000-20-02")
    render json: @users_after + @users_before
  end

  def user_id
    x = @user.as_json(:include => { :posts => {
      :include => { :comments => {
        :only => [:mark, :text]} },
      :only => [:title, :text, :picture] } })
    render json: x
  end

  def create
    @user = User.new user_params
  end

  def update
    @user.update(
      name: params[:user][:name]
    )
  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by id: params[:id]
  end
end


