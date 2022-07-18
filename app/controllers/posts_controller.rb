class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[update destroy]

  def create
    Post.create(
      title: params[:title],
      text: params[:text],
      picture:params[:picture],
      user_id:params[:user_id]
    )
  end

  def update
    @post.update(
      title: params[:title],
      text: params[:text],
      picture:params[:picture],
      user_id:params[:user_id]
    )
  end

  def destroy
    @post.destroy
  end


  def set_post
    @post = Post.find_by id: params[:id]
  end

end

