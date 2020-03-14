class HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = current_user.feed
    else
      @posts = Post.all
    end
    @users = User.all
  end

  def about
  end
end
