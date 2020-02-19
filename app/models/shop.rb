class Shop < ApplicationRecord
  has_many :posts
  has_many :post_images
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :address, presence: true
  validates :area, presence: true

  def self.search(search)
    return Shop.all unless search
    Shop.where(["name LIKE?","#{search}%"])
  end
end
