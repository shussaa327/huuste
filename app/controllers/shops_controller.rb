class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @shops = Shop.search(params[:search_area],params[:search_shop]).page(params[:page]).reverse_order
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render "shops/new"
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_posts = @shop.posts.page(params[:posts_pagina]).order(created_at: :desc)
  end

  private

  def shop_params
    params.require(:shop).permit(:name,:area_id,:address,:order_postal_code,
      :phone_number,:open_time,:close_time,:min_average_price,:max_average_price)
  end
end
