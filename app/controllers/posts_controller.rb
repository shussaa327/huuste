class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @post.shop_id = params[:shop_id]
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render "posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "posts/edit"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_page_comments = @post.post_comments.page(params[:page]).reverse_order
    @post_comment = PostComment.new
    @user = @post.user
    @following_users = @user.search_following_user(@user).page(params[:page]).reverse_order
    @follower_users = @user.search_follower_user(@user).page(params[:page]).reverse_order
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:comment, :image, :rating, :shop_id)
  end

  def ensure_correct_user
    post = Post.find(params[:id])
    if post.user_id != current_user.id
      redirect_to root_path
    end
  end

end
