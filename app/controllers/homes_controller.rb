class HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = current_user.feed.order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
    @users = User.all
  end

  def about
  end
end
