# -*- coding:utf-8 *-*
module ApplicationHelper

  # 生成一个与当前语言不同的链接地址
  def language_link
    if Rails.env == "development"
      if request.subdomain == "en"
        "#{link_to('中文', 'http://www.ft.local:3000')}".html_safe
      else
        "#{link_to('English', 'http://en.ft.local:3000')}".html_safe
      end
    end
  end
end
