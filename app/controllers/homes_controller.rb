class HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = current_user.feed.order(created_at: :desc)
    else
      @posts = Post.page(params[:page]).reverse_order.order(created_at: :desc)
    end
      @users = User.page(params[:page]).reverse_order
  end

  def about
  end
end
