class Shop < ApplicationRecord
  has_many :posts
  has_many :post_images
  has_many :shop_recommendations, dependent: :destroy
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :address, presence: true
  validates :area, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    return Shop.all unless search
    Shop.where(["name LIKE?","#{search}%"])
  end

  def shop_recommended_by?(user)
    shop_recommendations.where(user_id: user.id).exists?
  end

end
