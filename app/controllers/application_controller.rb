class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new_guest
    user = User.find_by(email: 'guest@guest') do |user|
      user.password = guest1
    end
    sign_in(user)
    redirect_to root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    end
end
