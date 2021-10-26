class Acme::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_account_update_params, only: [:update]

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :mobile_number
  end
end