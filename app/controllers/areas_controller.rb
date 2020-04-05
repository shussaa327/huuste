class AreasController < ApplicationController

  def show
    @area = Area.find(params[:id])
    @area_posts = @area.posts.page(params[:posts_pagina]).order(created_at: :desc)
  end
end
