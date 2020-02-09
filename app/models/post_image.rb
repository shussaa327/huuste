class PostImage < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :shop
  attachment :image
end
