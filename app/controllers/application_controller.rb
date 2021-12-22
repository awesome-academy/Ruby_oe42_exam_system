class ApplicationController < ActionController::Base
  before_action :set_locale
  include ExamsHelper

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_supervisor
    return if current_user.admin? || current_user.supervisor?

    flash[:warning] = t "insufficient_privileges"
    redirect_to root_url
  end

  def logged_in_user
    return if user_signed_in?

    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end
end
