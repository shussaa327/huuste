class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :following, :follower]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:posts_pagina]).order(created_at: :desc)
    @favorites = @user.favorites.page(params[:favorites_pagina]).order(created_at: :desc)
    @following_users = @user.search_following_user(@user).page(params[:following_pagina]).reverse_order
    @follower_users = @user.search_follower_user(@user).page(params[:follower_pagina]).reverse_order

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

  def ensure_correct_user
    user = User.find(params[:id])
    if user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

end
