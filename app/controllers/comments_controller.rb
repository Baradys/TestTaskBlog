class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[create delete]

  def create
    Comment.create(
      comment_params
    )
    render json: params
  end

  def destroy
    @comment.destroy
    render json: Comment.all
  end

  private
  def comment_params
    params.permit(:mark, :text, :post_id, :user_id)
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end