class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[update destroy]

  def create
    Post.create(
      post_params
    )
    render json: params
  end

  def update
    @post.update(
      post_params
    )
    render json: params
  end

  def destroy
    @post.destroy
    render json: Post.all
  end

  private

  def post_params
    params.permit(:title, :text, :picture, :user_id)
  end

  def set_post
    @post = Post.find_by id: params[:id]
  end

end

