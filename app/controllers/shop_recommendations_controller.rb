class ShopRecommendationsController < ApplicationController
  def index
    shop_recommendations = Shop_recommendations.all
  end

  def create
    shop = Shop.find(params[:shop_id])
    shop_recommendation = current_user.shop_recommendations.new(shop_id: shop.id)
    shop_recommendation.save
    redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    shop_recommendation = current_user.shop_recommendations.find_by(shop_id: shop.id)
    shop_recommendation.destroy
    redirect_to shop_path(shop)
  end
end
