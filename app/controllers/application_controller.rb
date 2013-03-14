class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

  before_filter :set_locale
  include HttpAcceptLanguage #WTF?!
  def set_locale
    I18n.locale = preferred_language_from(%w{zh-CN})
  end
end
