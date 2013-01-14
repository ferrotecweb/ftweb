class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    if request.subdomain.downcase == "en"
      I18n.locale = "en"
    else
      I18n.locale = "zh-CN"
    end
  end
end
