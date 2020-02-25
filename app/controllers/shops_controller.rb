class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @shops = Shop.search(params[:search])
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
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
       redirect_to shop_path(@shop)
    else
      render "shops/edit"
    end
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    respond_to do |format|
      format.js
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name,:area,:address,:order_postal_code,
      :phone_number,:open_time,:close_time,:min_average_price,:max_average_price)
  end
end
