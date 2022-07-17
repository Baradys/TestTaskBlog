class PostsController < ApplicationController
  before_action :set_post, only: %i[update delete]

  def create
    @post = Post.new post_params
  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find_by id: params[:id]
  end

end

