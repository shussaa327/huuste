class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :user_recommendations, dependent: :destroy
  has_many :shops
  attachment :user_image
end
