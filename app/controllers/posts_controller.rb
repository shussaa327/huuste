class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    posts = Post.all
  end

  def new
    @post = Post.new
    @post.shop_id = params[:shop_id]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user)
    else
      render "posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to root_path
    else
      render "posts/edit"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:comment, :image, :rating, :shop_id)
  end
end
