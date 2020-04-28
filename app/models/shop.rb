class Shop < ApplicationRecord
  has_many :posts
  has_many :shop_recommendations, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :area
  validates :name, presence: true
  validates :address, presence: true
  validates :area_id, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search_area,search_shop)
    search_area_name= Area.find_by(area_name: search_area)
    search_shop_name= Shop.where("shops.name LIKE ?", "%#{search_shop}%")

    if search_area_name.blank? and search_shop_name.blank?
      Shop.all
    elsif search_area_name.blank?
      search_shop_name
    elsif search_shop_name.blank?
      search_area_id = search_area_name.id
      Shop.where(area_id: search_area_id)
    else
      search_area_id = search_area_name.id
      Shop.where(area_id: search_area_id).where("shops.name LIKE ?", "%#{search_shop}%")
    end
  end

  def shop_recommended_by?(user)
    shop_recommendations.where(user_id: user.id).exists?
  end

end
