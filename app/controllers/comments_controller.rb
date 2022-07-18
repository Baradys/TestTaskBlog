class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[create delete]

  def create
    Comment.create(
      mark: params[:mark],
      text: params[:text],
      post_id:params[:post_id],
      user_id:params[:user_id]
    )
  end

  def destroy
    @comment.destroy
  end


  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end