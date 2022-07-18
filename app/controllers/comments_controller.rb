class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = Comment.new user_params
    if @comment.save
      render json: params
    else
      render json: {
        error: "Comment not saved"
      }
    end
  end

  def destroy
    if @comment.destroy
      render json: Comment.all
    else
      render json: {
        error: "Comment not deleted"
      }
    end
  end

  private

  def comment_params
    params.permit(:mark, :text, :post_id, :user_id)
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end