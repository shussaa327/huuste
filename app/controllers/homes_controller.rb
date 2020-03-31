class HomesController < ApplicationController
  def top
    if user_signed_in?
      @posts = current_user.feed.page(params[:posts_pagina]).order(created_at: :desc)
    else
      @posts = Post.page(params[:posts_pagina]).order(created_at: :desc)
    end
      @users = User.page(params[:users_pagina]).reverse_order
  end

  def about
  end
end
