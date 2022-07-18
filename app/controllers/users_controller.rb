class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[user_id update destroy]

  def users
    @users_after = User.created_after("2000-20-02")
    @users_before = User.created_before("2000-20-02")
    render json: @users_after + @users_before
  end

  def user_id
    @user = @user.as_json(:include => { :posts => {
      :include => { :comments => {
        :only => [:mark, :text]} },
      :only => [:title, :text, :picture] } })
    render json: @user
  end

  def create
    User.create(
      name: params[:name],
    id: params[:id]
    )
  end

  def update
    @user.update(
      name: params[:name]
    )
  end

  def destroy
    @user.destroy
  end

  def set_user
    @user = User.find_by id: params[:id]
  end
end


