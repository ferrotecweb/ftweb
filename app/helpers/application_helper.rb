# -*- coding:utf-8 *-*
module ApplicationHelper

  # 生成一个与当前语言不同的链接地址
  def language_link
    # 这里最好是用循环来读取语言页的内容
    # 然后以下拉的形式展示语言，下边的实现偷懒了，只确认实现中文，英文即可
    if session['I18n'].downcase == "en"
      "#{link_to '中文', set_language_path('zh-CN') }".html_safe
    else
      "#{link_to 'English', set_language_path('en') }".html_safe
    end
  end
end
