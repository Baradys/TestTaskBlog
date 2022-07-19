class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[update destroy]

  def create
    @post = Post.new post_params
    if @post.save
      render json: params
    else
      render json: {
        error: "Post not saved"
      }
    end
  end

  def update
    if @post.update(
      user_params
    )
      render json: params
    else
      render json: {
        error: "Post not updated"
      }
    end
  end

  def destroy
    if @post.destroy
      render json: Post.all
    else
      render json: {
        error: "Post not deleted"
      }
    end
  end

  private

  def post_params
    params.permit(:title, :text, :picture, :user_id)
  end

  def set_post
    @post = Post.find_by id: params[:id]
  end

end

