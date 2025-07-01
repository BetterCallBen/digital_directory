class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  def ensure_admin
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Veuillez vous connecter pour accéder à l'administration."
      return
    end

    unless current_user.admin?
      redirect_to root_path, alert: "Accès non autorisé."
    end
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_agencies_path
    else
      root_path
    end
  end
end
