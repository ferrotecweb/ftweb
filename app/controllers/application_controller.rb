# *-* coding:utf-8  *-*
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    # 初始化语言页,
    # 请务必确保数据库中link的子域名必须与语言代码一致。
    # 用session的话，就可以保证不会每次请求都读数据库的问题
    session['I18n'] ||= ""
    if session['I18n'].empty? and request.subdomain != "www" and Language.where("link like ?","http://#{request.subdomain}.%").count > 0
      # 根据子域名来判断,因为www，是默认的域名，不能作为子域名来判断
      session['I18n'] = request.subdomain
    end

    # 如果这时还没有确认语言，则直接使用默认语言
    if session['I18n'].empty?
      session['I18n'] = Language.where(:default => true).first.code
    end

    # 设置系统语言环境
    I18n.locale = session['I18n']
  end
end
