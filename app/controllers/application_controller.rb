class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  # around_filter :user_time_zone, if: :current_user

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
      { :locale => I18n.locale }
  end

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:role, :time_zone, :email, :password)}
  end

  private

  # def user_time_zone(&block)
  #   Time.use_zone(current_user.time_zone, &block)
  # end

end
