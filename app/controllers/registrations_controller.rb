class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :legal_agreement
  end

  def after_sign_up_path_for(resource)
    courses_path(:ref => "signup", :newuser => "true")
  end
end