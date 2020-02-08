class Post < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :user_recommendations, dependent: :destroy
  has_many :post_images, dependent: :destroy
  belongs_to :user
  belongs_to :shop
  attachment :image
end
