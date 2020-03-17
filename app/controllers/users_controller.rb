class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :following, :follower]

  def index
    users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
    @favorites = @user.favorites.all.order(created_at: :desc)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "users/edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:user_image,:introduction)
  end
end
