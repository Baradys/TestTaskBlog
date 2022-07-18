class CommentsController < ApplicationController
  before_action :set_comment, only: %i[create delete]
  def create
    @comment = Comment.new post_params
  end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:mark, :text)
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end