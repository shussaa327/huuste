class ShopRecommendationsController < ApplicationController

  def index
    shop_recommendations = Shop_recommendations.all.order(created_at: :desc)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @user = current_user
    shop_recommendation = current_user.shop_recommendations.new(shop_id: @shop.id)
    if current_user.shop_recommendations_count_over?(current_user)
      @shop_recommendations_count_over_message = "おすすめに登録できるのは5つまでです。"
    else
      shop_recommendation.save
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @user = current_user
    shop_recommendation = current_user.shop_recommendations.find_by(shop_id: @shop.id)
    shop_recommendation.destroy
  end
end
