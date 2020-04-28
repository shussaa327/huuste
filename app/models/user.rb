class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :shop_recommendations, dependent: :destroy
  has_many :shops
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :post_comments, dependent: :destroy
  attachment :user_image
  validates :name, presence: true, length: {maximum: 10}
  validates :introduction, length: {maximum: 200}
  validates :email, length: {minimum: 5, maximum: 70}

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  def search_follower_user(user)
    user.follower_user.where.not(id: user.id)
  end

  def search_following_user(user)
    user.following_user.where.not(id: user.id)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def shop_recommendations_count_over?(user)
    user.shop_recommendations.count > 4
  end

  def user_post_areas_count
    self.posts.joins(:area).group("areas.area_name").count
  end

end
