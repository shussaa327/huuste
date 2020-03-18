class ShopRecommendationsController < ApplicationController
  def index
    shop_recommendations = Shop_recommendations.all.order(created_at: :desc)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    shop_recommendation = current_user.shop_recommendations.new(shop_id: @shop.id)
    shop_recommendation.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    shop_recommendation = current_user.shop_recommendations.find_by(shop_id: @shop.id)
    shop_recommendation.destroy
  end
end
