class PostsController < ApplicationController

  def create
    @post = Post.new post_params
  end

  def update
    @post = Post.find_by id: params[:id]
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end

