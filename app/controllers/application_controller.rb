class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

 before_action :authenticate_user!, except: [:top,:about]

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_update_path_for(resource)
    user_path(current_user.id)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile_image, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :introduction])
  end


end
