class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    # 初始化语言页,确保数据库的locale设置正确
    if session['I18n'] == ""
      session['I18n'] = Language.where(:link => request.url).first.code
    end
    I18n.locale = session['I18n']
  end
end
