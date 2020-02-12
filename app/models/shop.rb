class Shop < ApplicationRecord
  has_many :posts
  has_many :post_images
  belongs_to :user, optional: true

  def self.search(search)
    return Shop.all unless search
    Shop.where(["name LIKE?","#{search}%"])
  end
end
