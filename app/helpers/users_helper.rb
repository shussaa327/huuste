module UsersHelper

  def user_post_areas_count(user)
    user.posts.joins(:area).group("areas.area_name").count
  end

end
