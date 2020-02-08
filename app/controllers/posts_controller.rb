class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to user_path(current_user)
  end

  def edit
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:comment, :rating)
  end
end
