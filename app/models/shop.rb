class Shop < ApplicationRecord
  has_many :posts
  has_many :post_images
end
