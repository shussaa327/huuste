class HomesController < ApplicationController

  def top
    if user_signed_in?
      @posts = current_user.feed.page(params[:posts_pagina]).order(created_at: :desc)
      @users = User.where.not(id: current_user.id).page(params[:users_pagina]).reverse_order
    else
      @posts = Post.page(params[:posts_pagina]).order(created_at: :desc)
      @users = User.page(params[:users_pagina]).reverse_order
    end
      @areas = Area.all
  end

  def about
  end

end
