class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :user_recommendations, dependent: :destroy
  has_many :post_images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :shop, optional: true
  attachment :image
  validates :comment, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
