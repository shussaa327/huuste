class HomesController < ApplicationController
  def top
    @posts = Post.all
    @users = User.all
  end

  def about
  end
end
