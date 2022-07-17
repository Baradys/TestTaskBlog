class CommentsController < ApplicationController

  def create
    @comments = Comment.new comment_params
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:mark, :text)
  end
end