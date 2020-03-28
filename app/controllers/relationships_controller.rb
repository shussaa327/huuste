class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @following_users = @user.search_following_user(@user).page(params[:page]).reverse_order
    @follower_users = @user.search_follower_user(@user).page(params[:page]).reverse_order
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    @following_users = @user.search_following_user(@user).page(params[:page]).reverse_order
    @follower_users = @user.search_follower_user(@user).page(params[:page]).reverse_order
  end
end
