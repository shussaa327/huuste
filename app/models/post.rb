class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :shop, optional: true
  belongs_to :area, optional: true
  attachment :image
  validates :comment, presence: true, length: {maximum: 200}
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
