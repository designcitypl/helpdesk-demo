class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :helpdesk_user,:helpdesk_admin?,:helpdesk_admin_collection
  def helpdesk_user
    current_user
  end

  def helpdesk_admin?
    current_user.has_role? :admin
  end

  def helpdesk_admin_collection
    (Helpdesk.user_class).with_role(:admin)
  end


  def default_url_options(options={})
    { locale: I18n.locale }
  end

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
