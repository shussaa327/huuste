class PostsController < ApplicationController
  def index
    posts = Post.all
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user)
    else
      render "posts/new"
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @post = Post.find(params[:id])
  end

  def update
    shop = Shop.find(params[:shop_id])
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:comment, :image, :rating)
  end
end
